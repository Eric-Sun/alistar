<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
<section class="content">
    <div class="col-md-9">
        <div class="box box-primary">
            <div class="box-body">
                    <div id="postInfo" class="input-group margin">


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
                    </div>
            </div>
            <!-- /input-group -->

            <div class="box-body table-responsive">
                <table id="replyTb" class="table table-bordered table-striped">
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
                                        v-on:click="updateOrder(index)">
                                    更新
                                </button>
                                <button class="btn btn-info btn-sm right"
                                        onclick="javascript:location.href='/post/delete?postId=${item.postId}&barId=${barId}'">
                                    删除
                                </button>
                            </td>
                        </tr>
                        </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
</section>
</@layout.mainLayout>
<script type="text/javascript">
    var tb = new Vue({
                el: "#tb",
                data: {
                    orderList: [],
                    statusList: []
                },
                created: function () {
                    var _self = this;
                    $.ajax({
                        url: "/admin/order/orderList",
                        dataType: 'json',
                        success: function (data) {
                            _self.orderList = data.orderList;
                        }
                    })

                },
                methods: {
                    updateOrder: function (index) {
                        modal.$data.order = this.orderList[index];
                        $('#myModal').modal();
                    },
                    reload: function () {
                        $.ajax({
                            url: "/admin/order/orderList",
                            dataType: 'json',
                            success: function (data) {
                                tb.$data.orderList = data.orderList;
                            }
                        })
                    },
                    startThumb: function (index) {
                        thumbModal.$data.imgUrl = this.orderList[index].img;
                        $('#thumbModal').modal();
                    },
                    deleteOrder: function (orderNumber) {
                        var _self = this;
                        $.ajax({
                            url: "/admin/order/orderDelete",
                            data: {"orderNumber": orderNumber},
                            success: function () {
                                alert("删除订单成功");
                                for (var i = 0; i < _self.orderList.length; i++) {
                                    if (_self.orderList[i].orderNumber == orderNumber) {
                                        _self.orderList.splice(i, 1);
                                    }
                                }
                            }
                        });
                    },
                    setPainter: function (orderNumber) {
                        $('#setPainterModal').modal();
                        painterListTable.$options.methods.loadPainterList(orderNumber);
                    }

                }
            })
            ;
</script>
