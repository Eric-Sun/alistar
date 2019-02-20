<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
<section id="postDetail" class="content">
    <div class="col-md-9">
        <div class="box box-primary">
            <div class="box-body">
                <div class="input-group margin">
                    <div class="form-group form-inline">
                        <label>发帖人用户</label>
                        <label class="form-control">{{post.userName}}<label>
                    </div>
                    <div class="form-group">
                        <label>帖子内容</label>
                        <label class="form-control">{{post.content}}</label>
                    </div>
                    <div class="form-group">
                        <label>创建时间</label>
                        <label class="form-control">{{post.createtime}}</label>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-info btn-sm right" v-on:click="showCreateReplyModal">创建新的回复</button>
                    </div>
                </div>
            </div>
            <!-- /input-group -->

            <div class="box-body table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>回复id</th>
                        <th>发帖人</th>
                        <th>回复内容</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="(reply,index) in replyList">
                        <td>{{reply.replyId}}</td>
                        <td>{{reply.userName}}</td>
                        <td>{{reply.content}}</td>
                        <td>{{reply.createtime}}</td>
                        <td>
                            <button class="btn btn-info btn-sm right"
                                    v-on:click="showUpdateReplyModal(index)">
                                更新
                            </button>
                            <button class="btn btn-info btn-sm right"
                                    v-on:click="deleteReply(index)">
                                删除
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="createReplyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form @submit.prevent="createReplySubmit" method="post">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">创建回复22</h4>
                    </div>
                    <div class="modal-body">
                        <div class="input-group margin">
                            <div class="form-group form-inline">
                                <label>用户id</label>
                                <input type="text" class="form-control" name="userId" v-model="addReply.userId"/>
                            </div>
                            <div class="form-group">
                                <label>回复内容</label>
                            <textarea class="form-control" rows="3" placeholder="Enter ..." name="content"
                                      v-model="addReply.content"></textarea>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default">创建</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" v-on:click="close()">关闭
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="modal fade" id="updateReplyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form @submit.prevent="updateReplySubmit" method="post">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">创建回复22</h4>
                    </div>
                    <div class="modal-body">
                        <div class="input-group margin">
                            <div class="form-group form-inline">
                                <label>用户id</label>
                                <input type="text" class="form-control" name="userId" v-model="updateReply.userId"/>
                            </div>
                            <div class="form-group">
                                <label>回复内容</label>
                            <textarea class="form-control" rows="3" placeholder="Enter ..." name="content"
                                      v-model="updateReply.content"></textarea>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default">创建</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" v-on:click="close()">关闭
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</section>
</@layout.mainLayout>
<script type="text/javascript">
    var postDetail = new Vue({
                el: "#postDetail",
                data: {
                    postId: "",
                    barId: "",
                    post: {},
                    addReply: {},
                    updateReply: {},
                    replyList: []
                },
                created: function () {
                    this.postId = getQueryString("postId");
                    this.barId = getQueryString("barId");
                    this.getReplyList();
                    this.getPostInfo();
                },
                methods: {
                    getReplyList: function () {
                        var that = this;
                        $.ajax({
                            url: "/reply/getReplyList",
                            data: {
                                postId: this.postId
                            },
                            dataType: "json",
                            success: function (data) {
                                that.replyList = data;
                            }
                        })
                    },
                    getPostInfo: function () {
                        var that = this;
                        $.ajax({
                            url: "/post/getDetail",
                            data: {
                                postId: this.postId
                            },
                            dataType: "json",
                            success: function (data) {
                                that.post = data;
                            }
                        })
                    },
                    showCreateReplyModal: function () {
                        $("#createReplyModal").modal();
                    },
                    createReplySubmit: function () {
                        var that = this;
                        $.ajax({
                            url: "/reply/create",
                            data: {
                                userId: this.addReply.userId,
                                content: this.addReply.content,
                                postId: this.postId,
                                barId: this.barId
                            },
                            dataType: "json",
                            success: function (data) {
                                alert("创建成功");
                                $("#createReplyModal").modal('hide');
                                that.getReplyList();
                            }
                        })

                    },
                    deleteReply: function (index) {
                        var replyId = this.replyList[index].replyId;
                        var that = this;
                        $.ajax({
                            url: "/reply/delete",
                            data: {
                                replyId: replyId
                            },
                            dataType: "json",
                            success: function (data) {
                                that.replyList.splice(index, 1);
                            }
                        })
                    },
                    showUpdateReplyModal: function (index) {
                        var replyId = this.replyList[index].replyId;
                        var that = this;
                        $("#updateReplyModal").modal();
                        $.ajax({
                            url: "/reply/getReply",
                            data: {
                                replyId: replyId
                            },
                            dataType: "json",
                            success: function (data) {
                                that.updateReply = data;
                            }
                        })
                    },
                    updateReplySubmit: function () {
                        var that = this;
                        $.ajax({
                            url: "/reply/update",
                            data: {
                                replyId: this.updateReply.replyId,
                                userId: this.updateReply.userId,
                                content: this.updateReply.content
                            },
                            dataType: "json",
                            success: function (data) {
                                alert("成功")
                                $("#updateReplyModal").modal('hide')
                                that.getReplyList()
                            }
                        })
                    }
                }
            })
            ;
</script>
