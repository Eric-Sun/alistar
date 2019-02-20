<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">

            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">吧列表</h3>
                </div>
                <div class="box-body">
                    <button class="btn btn-info btn-sm right"
                            onclick="javascript:location.href='/bar/preCreate'">
                        创建新吧
                    </button>
                </div>
                <!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="tb" class="table table-bordered table-striped">
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


<script type="text/javascript">

    var tb = new Vue({
                el: "#tb",
                data: {
                    barList: []
                },
                created: function () {
                    var _self = this;
                    $.ajax({
                        url: "/bar/getBarList",
                        dataType: 'json',
                        success: function (data) {
                            _self.barList = data;
                        }
                    })

                },
                methods: {
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
                    }

                }
            })
            ;
</script>