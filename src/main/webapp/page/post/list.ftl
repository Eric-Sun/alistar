<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">

                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">吧名称：${barName}</h3>
                    </div>
                    <div class="box-body">
                        <button class="btn btn-info btn-sm right"
                                onclick="javascript:location.href='/post/preCreate'">
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
                                <th>删除</th>
                            </tr>
                            </thead>
                            <tbody>
                                <#list data as item>
                                <tr>
                                    <td>${item.postId}</td>
                                    <td>${item.userName}</td>
                                    <td>${item.content}</td>
                                    <td>${item.createtime}</td>
                                    <td>
                                        <button class="btn btn-info btn-sm right"
                                                onclick="javascript:location.href='/post/delete?postId=${item.postId}'">
                                            删除
                                        </button>
                                    </td>
                                </tr>
                                </#list>
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