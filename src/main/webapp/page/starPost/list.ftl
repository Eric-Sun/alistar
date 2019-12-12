<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">

                <div id="tb" class="box">
                    <div class="box-header">
                        <h3 class="box-title">精华帖子列表</h3>
                    </div>

                    <!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>帖子id</th>
                                <th>标题</th>
                                <th>删除</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(starPost,index) in starPostList">
                                <td>{{starPost.postId}}</td>
                                <td><a style="cursor:pointer;"
                                       v-on:click="navToPostDetail(index)">{{starPost.title}}</a></td>
                                <td>
                                    <button class="btn btn-info btn-sm right"
                                            v-on:click="deleteStarPost(index)">
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

    var tb = new Vue({
            el: "#tb",
            data: {
                starPostList: []
            },
            created: function () {
                this.loadData();
            },
            methods: {
                loadData: function () {
                    var _self = this;
                    $.ajax({
                        url: "/starPost/getStarPostList",
                        dataType: 'json',
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            Vue.set(tb, "starPostList", data);
                        }
                    })
                },
                navToPostDetail: function (index) {
                    var postId = this.starPostList[index].postId;
                    location.href = "/post/detail?postId=" + postId + "&barId=12";
                },
                deleteStarPost: function (index) {
                    var _self = this;
                    var willDeleteId = this.starPostList[index].id;
                    $.ajax({
                        url: "/starPost/delete",
                        data: {
                            id: willDeleteId
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }

                            _self.starPostList.splice(index, 1);
                            alert("成功");
                        }
                    })
                }
            }
        })
    ;
</script>