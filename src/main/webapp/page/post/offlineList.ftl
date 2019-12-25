<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">

                <div id="tb" class="box">
                    <div class="box-header">
                        <h3 class="box-title">已下线帖子列表</h3>
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
                            <tr v-for="(post,index) in postList">
                                <td>{{post.postId}}</td>
                                <td>{{post.title}}</td>
                                <td>
                                    <button class="btn btn-info btn-sm right"
                                            v-on:click="onlinePost(index)">
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
                postList: [],
                barId: 0
            },
            created: function () {
                this.barId = getQueryString("barId");
                this.loadData();
            },
            methods: {
                loadData: function () {
                    var _self = this;
                    console.log(this.barId);
                    $.ajax({
                        url: "/post/getOfflineList",
                        data: {
                            barId: this.barId
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            Vue.set(tb, "postList", data);
                        }
                    })
                },
                onlinePost: function (index) {
                    var _self = this;
                    var postId = this.postList[index].id;
                    $.ajax({
                        url: "/post/online",
                        data: {
                            postId: postId
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }

                            _self.postList.splice(index, 1);
                            alert("成功");
                        }
                    })
                }
            }
        })
    ;
</script>