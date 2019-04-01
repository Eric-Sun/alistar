<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
<section id="auditReplyList" class="content">
    <div class="box-body table-responsive">
        <table class="table table-bordered table-striped"
               style="table-layout: fixed;word-break:break-all; word-wrap:break-all;">
            <thead>
            <tr>
                <th class="col-md-1">回复id</th>
                <th class="col-md-1">发帖人</th>
                <th class="col-md-6">回复内容</th>
                <th class="col-md-1">是否是匿名</th>
                <th class="col-md-2">创建时间</th>
                <th class="col-md-2">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(reply,index) in replyList">
                <td class="col-md-1">{{reply.replyId}}</td>
                <td class="col-md-1">{{reply.userName}}</td>
                <td class="col-md-6">{{reply.content}}
    </div>
    </td>
    <td class="col-md-1">
        <div v-if="reply.anonymous==0">
            非匿名
        </div>
        <div v-if="reply.anonymous==1">
            匿名
        </div>
    </td>
    <td class="col-md-2">{{reply.createtime}}</td>
    <td class="col-md-2">
        <button class="btn btn-info btn-sm right"
                v-on:click="navigateToDetail(index)">
            查看
        </button>
    </td>
    </tr>
    </tbody>
    </table>
    </div>
    </div>


</section>
</@layout.mainLayout>
<script type="text/javascript">
    var postDetail = new Vue({
                el: "#auditReplyList",
                data: {
                    replyList: {}
                },
                created: function () {
                    this.getReplyList();
                }
                ,
                methods: {
                    getReplyList: function () {
                        var that = this;
                        $.ajax({
                            url: "/audit/getReplyList",
                            data: {
                                barId: 1
                            },
                            dataType: "json",
                            success: function (data) {
                                console.log(JSON.stringify(data));
                                if (data.errCode != null) {
                                    alert("失败,errCode=" + data.errCode);
                                    return;
                                }
                                that.replyList = data;
                            }
                        })
                    },
                    navigateToDetail: function (index) {
                        var lastReplyId = this.replyList[index].lastReplyId;
                        var postId = this.replyList[index].postId;
                        var barId = this.replyList[index].barId;
                        console.log(lastReplyId);
                        if (lastReplyId == 0) {
                            location.href = "/post/detail?postId=" + postId + "&barId=" + barId;
                        } else {
                            location.href = "/reply/detail?replyId=" + lastReplyId;
                        }
                    }
                }
            })
            ;
</script>
