<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section id="tb" class="content">
        <div class="row">
            <div class="col-xs-12">

                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">用户列表</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-5">
                                <input type="text" v-model="queryData"/>
                            </div>
                            <div class="col-md-7">
                                <button type="button" v-on:click="queryNickname">昵称搜索</button>
                            </div>

                        </div>
                    </div>

                    <!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>用户id</th>
                                <th>用户昵称</th>
                                <th>是否被封号</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(user,index) in userList">
                                <td>{{user.userId}}</td>
                                <td>{{user.nickName}}</td>
                                <td v-if="user.isLock==0">正常</td>
                                <td v-if="user.isLock==1">已封号</td>
                                <td>{{user.createtime}}</td>
                                <td>
                                    <button v-if="user.isLock==0" class="btn btn-info btn-sm right"
                                            v-on:click="doLockUser(index)">
                                        封号
                                    </button>
                                    <button v-if="user.isLock==1" class="btn btn-info btn-sm right"
                                            v-on:click="doUnlockUser(index)">
                                        解封
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->

                </div>
                <!-- /.box -->
            </div>
        </div>


        <div class="modal fade" id="lockModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form @submit.prevent="lockUserSubmit" method="post">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">封号</h4>
                        </div>
                        <div class="modal-body">

                            <div class="input-group margin">

                                <div class="form-group form-inline">
                                    <label>用户id</label>
                                    <input type="text" class="form-control" name="name"
                                           v-model="lockUser.lockUserId"/>
                                </div>

                                <div class="form-group">
                                    <label>封号类型</label>
                                    <select class="form-control" v-model="lockUser.lockReasonType">
                                        <option value="1">辱骂</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>封号原因</label>
                                    <textarea class="form-control" cols="80" rows="10" placeholder="Enter ..."
                                              name="content"
                                              v-model="lockUser.lockReason"></textarea>
                                </div>

                                <div class="form-group">
                                    <label>封号时间（天）</label>
                                    <input type="text" class="form-control" name="name" v-model="lockUser.lockTimeDay"/>
                                </div>

                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default">操作</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" v-on:click="close()">关闭
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="unlockModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form @submit.prevent="unlockUserSubmit" method="post">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">解封</h4>
                        </div>
                        <div class="modal-body">

                            <div class="input-group margin">

                                <div class="form-group form-inline">
                                    <label>用户id</label>
                                    <input type="text" class="form-control" name="name" disabled="disabled"
                                           v-model="unlockUser.unlockUserId"/>
                                </div>


                                <div class="form-group">
                                    <label>解封原因</label>
                                    <textarea class="form-control" cols="80" rows="10" placeholder="Enter ..."
                                              name="content"
                                              v-model="unlockUser.unlockReason"></textarea>
                                </div>

                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default">操作</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" v-on:click="close()">关闭
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </section>
    <!-- /.content -->
</@layout.mainLayout>


<script type="text/javascript">


    var tb = new Vue({
            el: "#tb",
            data: {
                queryData: "",
                userList: [],
                lockUser: {
                    lockUserId: 0,
                    lockReasonType: 1,
                    lockTimeDay: 1,
                    lockReason: ""
                },
                unlockUser: {
                    unlockUserId: 0,
                    unlockReason: ""
                }
            },
            created: function () {
                // this.loadData();
            },
            methods: {
                loadData: function () {
                    var that = this;
                    $.ajax({
                        url: "/user/getUserList",
                        data: {pageNum: 0},
                        dataType: 'json',
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            that.userList = data;
                        }
                    })
                },
                queryNickname: function () {
                    var that = this;
                    $.ajax({
                        url: "/user/searchUser",
                        data: {
                            text: this.queryData,
                            pageNum: 0
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            that.userList = data;
                        }
                    })
                },
                doLockUser: function (index) {
                    const lockUserId = this.userList[index].userId;
                    this.lockUser.lockUserId = lockUserId;
                    $("#lockModal").modal();
                },
                doUnlockUser: function (index) {
                    const unlockUserId = this.userList[index].userId;
                    this.unlockUser.unlockUserId = unlockUserId;
                    $("#unlockModal").modal();
                },
                lockUserSubmit: function () {

                    const unlockTime = Date.parse(new Date()) + this.lockUser.lockTimeDay * 24 * 60 * 60 * 1000;
                    var that = this;
                    $.ajax({
                        url: "/user/lock",
                        data: {
                            lockUserId: this.lockUser.lockUserId,
                            lockReasonType: this.lockUser.lockReasonType,
                            lockReason: this.lockUser.lockReason,
                            unlockTime: unlockTime
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            $("#lockModal").modal('hide');
                            that.queryNickname();
                        }
                    })
                },
                unlockUserSubmit: function () {
                    var that = this;
                    $.ajax({
                        url: "/user/unlock",
                        data: {
                            unlockUserId: this.unlockUser.unlockUserId,
                            unlockReason: this.unlockUser.unlockReason,
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            $("#unlockModal").modal('hide');
                            that.queryNickname();
                        }
                    })
                }

            }
        })
    ;
</script>