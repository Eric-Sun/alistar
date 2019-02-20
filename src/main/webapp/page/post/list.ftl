<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
    <div id="postListDiv" class="row">
        <div class="col-xs-12">

            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">吧名称：{{barName}}</h3>
                </div>
                <div class="box-body">
                    <button class="btn btn-info btn-sm right"
                            onclick="javascript:location.href='/post/preCreate?barId='">
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
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr v-for="(post,index) in postList">
                            <td>{{post.postId}}</td>
                            <td>{{post.userName}}</td>
                            <td><a style="cursor:pointer;"
                                   onclick="javascript:location.href='/post/detail?postId={{post.postId}}&barId={{barId}}'">{{post.content}}</a>
                            </td>
                            <td>{{post.createtime}}</td>
                            <td>
                                <button class="btn btn-info btn-sm right"
                                        onclick="javascript:location.href='/post/preUpdate?postId={{post.postId}}&barId={{barId}}'">
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

</section>
<!-- /.content -->
</@layout.mainLayout>
<script type="text/javascript">
    var postListDiv = new Vue({
                el: "#postListDiv",
                data: {
                    barName: "",
                    postList: [],
                    barId: 0
                },
                created: function () {
                    this.barId = getQueryString("barId");
                    this.getPostList();
                },
                methods: {
                    getPostList: function () {
                        var _self = this;
                        $.ajax({
                            url: "/post/getPostList",
                            data: {
                                barId: this.barId
                            },
                            dataType: "json",
                            success: function (data) {
                                _self.postList = data.postList;
                                _self.barName = data.barName;
                            }
                        });
                    },
                    deletePost: function (index) {
                        var postId = this.postList[index].postId;
                        var that = this;
                        $.ajax({
                            url: "/post/delete",
                            data: {
                                postId: postId
                            },
                            dataType: "json",
                            success: function (data) {
                                alert("成功");
                                that.postList.splice(index, 1);
                            }
                        })
                    }
                }
            })
            ;
</script>