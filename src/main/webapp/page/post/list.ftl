<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section id="postList" class="content">
    <div class="row">
        <div class="col-xs-12">

            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">吧名称：{{barName}}</h3>
                </div>
                <div class="box-body">
                    <button class="btn btn-info btn-sm right"
                            v-on:click="showCreatePostModal()">
                        创建新帖子
                    </button>
                </div>
                <!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>帖子id</th>
                            <th>发帖人</th>
                            <th>帖子内容</th>
                            <th>创建时间</th>
                            <th>最后更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr v-for="(post,index) in postList">
                            <td>{{post.postId}}</td>
                            <td>{{post.userName}}</td>
                            <td>
                                <div v-if="post.showLongContent">
                                    <a style="cursor:pointer;"
                                       v-on:click="navToPostDetail(index)">{{post.shortContent}}</a>
                                    <button class="btn btn-info btn-sm right"
                                            v-on:click="showLongContent(index)">
                                        显示全部
                                    </button>
                                </div>
                                <div v-else>
                                    <a style="cursor:pointer;"
                                       v-on:click="navToPostDetail(index)">{{post.content}}</a>
                                </div>
                            </td>
                            <td>{{post.createtime}}</td>
                            <td>{{post.updatetime}}</td>
                            <td>
                                <button class="btn btn-info btn-sm right"
                                        v-on:click="showUpdatePostModal(index)">
                                    更新
                                </button>
                                <button class="btn btn-info btn-sm right"
                                        v-on:click="deletePost(index)">
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


    <div class="modal fade" id="createPostModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form @submit.prevent="createPostSubmit" method="post">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">创建帖子</h4>
                    </div>
                    <div class="modal-body">
                        <div class="input-group margin">
                            <div class="form-group form-inline">
                                <label>发帖人用户id</label>
                                <input type="text" class="form-control" name="userId" v-model="userId"/>
                            </div>
                            <div class="form-group">
                                <label>帖子内容</label>
                            <textarea class="form-control" cols="80" rows="10" placeholder="Enter ..." name="content"
                                      v-model="content"></textarea>
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

    <div class="modal fade" id="updatePostModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form @submit.prevent="updatePostSubmit" method="post">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">更新帖子</h4>
                    </div>
                    <div class="modal-body">
                        <div class="input-group margin">
                            <div class="form-group form-inline">
                                <label>发帖人用户id</label>
                                <input type="text" class="form-control" name="userId" v-model="updatePost.userId"
                                        />
                            </div>
                            <div class="form-group">
                                <label>帖子内容</label>
                            <textarea class="form-control" cols="80" rows="10" placeholder="Enter ..." name="content"
                                      v-model="updatePost.content"></textarea>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default">更新</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" v-on:click="close()">关闭
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="longContentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    全部内容
                </div>
                <div class="modal-body">
                    {{longContent}}
                </div>
                <div class="modal-footer">
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
    var postList = new Vue({
                el: "#postList",
                data: {
                    barName: "",
                    postList: [],
                    barId: 0,
                    content: "",
                    userId: "",
                    updatePost: {},
                    longContent: ""
                },
                created: function () {
                    this.barId = getQueryString("barId");
                    this.getPostList();
                },
                methods: {
                    createPostSubmit: function () {
                        var that = this;
                        $.ajax({
                            url: "/post/create",
                            data: {
                                barId: this.barId,
                                content: this.content,
                                userId: this.userId
                            },
                            type: "post",
                            success: function (data) {
                                alert("创建成功");
                                $("#createPostModal").modal('hide');
                                that.getPostList();
                            }
                        });
                    },
                    getPostList: function () {
                        var that = this;
                        $.ajax({
                            url: "/post/getPostList",
                            data: {
                                barId: this.barId
                            },
                            dataType: "json",
                            success: function (data) {
                                that.postList = data.postList;
                                that.barName = data.barName;
                            },
                            error: function (data) {
                                alert(JSON.stringify(data));
                            }
                        });
                    },
                    deletePost: function (index) {
                        var postId = this.postList[index].postId;
                        var that = this;
                        $.ajax({
                            url: "/post/delete",
                            data: {
                                postId: postId,
                                barId: this.barId
                            },
                            dataType: "json",
                            success: function (data) {
                                alert("成功");
                                that.postList.splice(index, 1);
                            }
                        })
                    },
                    showCreatePostModal: function () {
                        $("#createPostModal").modal();
                    },
                    showUpdatePostModal: function (index) {
                        var postId = this.postList[index].postId;
                        var that = this;
                        $("#updatePostModal").modal();
                        $.ajax({
                            url: "/post/getDetail",
                            data: {
                                postId: postId
                            },
                            dataType: "json",
                            success: function (data) {
                                that.updatePost = data;
                            }
                        })
                    },
                    navToPostDetail: function (index) {
                        var postId = this.postList[index].postId;
                        location.href = "/post/detail?postId=" + postId + "&barId=" + this.barId;
                    },
                    updatePostSubmit: function () {
                        var that = this;
                        $.ajax({
                            url: "/post/update",
                            data: {
                                postId: this.updatePost.postId,
                                content: this.updatePost.content
                            },
                            type: "post",
                            dataType: "json",
                            success: function (data) {
                                alert("更新成功")
                                $("#updatePostModal").modal('hide');
                                that.getPostList();
                            }
                        })
                    },
                    showLongContent: function (index) {
                        $("#longContentModal").modal();
                        this.longContent = this.postList[index].content;
                    }
                }
            })
            ;

</script>