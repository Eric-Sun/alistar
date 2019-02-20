<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">

            <div id="tb" class="box">
                <div class="box-header">
                    <h3 class="box-title">吧列表</h3>
                </div>
                <div class="box-body">
                    <button class="btn btn-info btn-sm right" v-on:click="showCreateBarModal()">
                        创建新吧
                    </button>
                </div>
                <!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>吧id</th>
                            <th>吧名称</th>
                            <th>吧主昵称</th>
                            <th>创建时间</th>
                            <th>删除</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="(bar,index) in barList">
                            <td>{{bar.barId}}</td>
                            <td><a style="cursor:pointer;"
                                   v-on:click="navToPostList(index)">{{bar.name}}</a></td>
                            <td>{{bar.userName}}</td>
                            <td>{{bar.createtime}}</td>
                            <td>
                                <button class="btn btn-info btn-sm right"
                                        v-on:click="deleteBar(index)">
                                    删除
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

</section>
<!-- /.content -->
</@layout.mainLayout>

<div class="modal fade" id="createBarModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form @submit.prevent="createBarSubmit" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">创建BAR</h4>
                </div>
                <div class="modal-body">

                    <div class="input-group margin">

                        <div class="form-group form-inline">
                            <label>吧名称</label>
                            <input type="text" class="form-control" name="name" v-model="barName"/>
                        </div>
                        <div class="form-group form-inline">
                            <label>吧主id</label>
                            <input type="text" class="form-control" name="userId" v-model="userId"/>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">创建</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" v-on:click="close()">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">

    var modal = new Vue({
                el: "#createBarModal",
                data: {
                    barName: "",
                    userId: ""
                },
                created: function () {
                },
                methods: {
                    createBarSubmit: function () {
                        $.ajax({
                            url: "/bar/create",
                            data: {
                                name: this.barName,
                                userId: this.userId
                            },
                            success: function (data) {
                                alert("创建成功");
                                $("#createBarModal").modal('hide');
                                tb.$options.methods.loadData();
                            }
                        });
                    }
                }
            })
            ;

    var tb = new Vue({
                el: "#tb",
                data: {
                    barList: []
                },
                created: function () {
                    this.loadData();
                },
                methods: {
                    loadData: function () {
                        var _self = this;
                        $.ajax({
                            url: "/bar/getBarList",
                            dataType: 'json',
                            success: function (data) {
                                Vue.set(tb, "barList", data);
                            }
                        })
                    },
                    navToPostList: function (index) {
                        var barId = this.barList[index].barId;
                        window.location.href = "/post/list?barId=" + barId;
                    },
                    deleteBar: function (index) {
                        var _self = this;
                        var willDeleteId = this.barList[index].barId;
                        $.ajax({
                            url: "/bar/delete",
                            data: {
                                barId: willDeleteId
                            },
                            dataType: 'json',
                            success: function (data) {
                                _self.barList.splice(index, 1);
                                alert("成功");
                            }
                        })
                    },
                    showCreateBarModal: function () {
                        $('#createBarModal').modal()
                    }

                }
            })
            ;
</script>