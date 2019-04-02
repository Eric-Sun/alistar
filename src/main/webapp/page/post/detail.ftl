<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
<div id="postDetail">
    <section class="content-header">
        <h1>
            帖子详情页面
        </h1>

        <ol class="breadcrumb">
            <li v-for="(info,index) in post.levelInfo" class="active">
                <a v-if="info.type==0" style="cursor:pointer"
                   @click.stop="navigate(info.type,info.id)">主题({{info.id}})</a>
                <a v-if="info.type==1" style="cursor:pointer"
                   @click.stop="navigate(info.type,info.id)">帖子({{info.id}})</a>
                <a v-if="info.type==2" style="cursor:pointer"
                   @click.stop="navigate(info.type,info.id)">回复({{info.id}})</a>
            </li>
        </ol>
    </section>
    <section class="content">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-2">
                            发帖人用户
                        </div>
                        <div class="col-md-10">
                            {{post.userName}}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            标题
                        </div>
                        <div class="col-md-10">
                            {{post.title}}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            帖子内容
                        </div>
                        <div v-if="post.showLongContent" class="col-md-10">
                            {{post.shortContent}}
                            <button class="btn btn-info btn-sm right"
                                    v-on:click="showLongContent()">
                                显示全部
                            </button>
                        </div>
                        <div v-else class="col-md-10">
                            {{post.content}}
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            是否匿名
                        </div>
                        <div class="col-md-10">
                            <div v-if="post.anonymous==0">非匿名</div>
                            <div v-else>匿名</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            帖子类型
                        </div>
                        <div class="col-md-10">
                            <div v-if="post.type==0">故事贴</div>
                            <div v-else>一日一记</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            创建时间
                        </div>
                        <div class="col-md-10">
                            {{post.createtime}}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            最近更新时间
                        </div>
                        <div class="col-md-10">
                            {{post.updatetime}}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <button class="btn btn-info btn-sm right" v-on:click="showCreateReplyModal">创建新的回复</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /input-group -->

            <div class="box-body table-responsive">
                <table class="table table-bordered table-striped">
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
                        <td class="col-md-6">{{reply.content}}<a style="cursor:pointer"
                                                                 v-on:click="navToLevel2Reply(reply.replyId)">{{reply.replyList.length}}条回复</a>
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

<div class="modal fade" id="createReplyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form @submit.prevent="createReplySubmit" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">创建回复</h4>
                </div>
                <div class="modal-body">
                    <div class="input-group margin">
                        <div class="form-group form-inline">
                            <label>用户id</label>
                            <input type="text" class="form-control" name="userId" v-model="addReply.userId"/>
                        </div>
                        <div class="form-group">
                            <label>回复内容</label>
                            <textarea class="form-control" cols="80" rows="10" placeholder="Enter ..." name="content"
                                      v-model="addReply.content"></textarea>
                        </div>
                        <div class="form-group">
                            <label>是否匿名</label>
                            <select class="form-control" v-model="anonymous">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
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
                    <h4 class="modal-title" id="myModalLabel">创建回复</h4>
                </div>
                <div class="modal-body">
                    <div class="input-group margin">
                        <div class="form-group form-inline">
                            <label>用户id</label>
                            <input type="text" class="form-control" name="userId" v-model="updateReply.userId"/>
                        </div>
                        <div class="form-group">
                            <label>回复内容</label>
                            <textarea class="form-control" cols="80" rows="10" placeholder="Enter ..." name="content"
                                      v-model="updateReply.content"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>是否匿名</label>
                        <select class="form-control" v-model="updateReply.anonymous">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
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

<div class="modal fade" id="longContentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                全部内容
            </div>
            <div class="modal-body">
                {{post.content}}
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
</div>
</@layout.mainLayout>
<script type="text/javascript">
    var postDetail = new Vue({
                el: "#postDetail",
                data: {
                    postId: "",
                    barId: "",
                    anonymous: 0,
                    post: {}
                    ,
                    addReply: {}
                    ,
                    updateReply: {}
                    ,
                    replyList: []
                },
                created: function () {
                    this.postId = getQueryString("postId");
                    this.barId = getQueryString("barId");
                    this.getReplyList();
                    this.getPostInfo();
                }
                ,
                methods: {
                    navigate: function (type, id) {
                        if (type == 0) {
                            location.href = "/post/list?barId=" + this.reply.barId;
                        } else if (type == 1) {
                            location.href = "/post/detail?postId=" + id + "&barId=" + this.reply.barId;
                        } else {
                            location.href = "/reply/detail?replyId=" + id + "&level=3";
                        }
                        console.log(type);
                        console.log(id);

                    },
                    getReplyList: function () {
                        var that = this;
                        $.ajax({
                            url: "/reply/getReplyList",
                            data: {
                                postId: this.postId
                            },
                            dataType: "json",
                            success: function (data) {
                                if (data.errCode != null) {
                                    alert("失败,errCode=" + data.errCode);
                                    return;
                                }
                                that.replyList = data;
                            }
                        })
                    }
                    ,
                    getPostInfo: function () {
                        var that = this;
                        $.ajax({
                            url: "/post/getDetail",
                            data: {
                                postId: this.postId
                            },
                            dataType: "json",
                            success: function (data) {
                                console.log(JSON.stringify(data));
                                if (data.errCode != null) {
                                    alert("失败,errCode=" + data.errCode);
                                    return;
                                }
                                that.post = data;
                            }
                        })
                    }
                    ,
                    showCreateReplyModal: function () {
                        $("#createReplyModal").modal();
                    }
                    ,
                    createReplySubmit: function () {
                        var that = this;
                        $.ajax({
                            url: "/reply/create",
                            data: {
                                userId: this.addReply.userId,
                                content: this.addReply.content,
                                postId: this.postId,
                                barId: this.barId,
                                anonymous: this.anonymous,
                                lastReplyId: 0
                            },
                            type: "post",
                            dataType: "json",
                            success: function (data) {
                                if (data.errCode != null) {
                                    alert("失败,errCode=" + data.errCode);
                                    return;
                                }
                                alert("创建成功");
                                $("#createReplyModal").modal('hide');
                                that.getReplyList();
                            }
                        })

                    }
                    ,
                    deleteReply: function (index) {
                        var replyId = this.replyList[index].replyId;
                        var that = this;
                        $.ajax({
                            url: "/reply/delete",
                            data: {
                                replyId: replyId,
                                postId: this.postId
                            },
                            dataType: "json",
                            success: function (data) {
                                if (data.errCode != null) {
                                    alert("失败,errCode=" + data.errCode);
                                    return;
                                }
                                that.replyList.splice(index, 1);
                            }
                        })
                    }
                    ,
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
                                if (data.errCode != null) {
                                    alert("失败,errCode=" + data.errCode);
                                    return;
                                }
                                that.updateReply = data;
                            }
                        })
                    }
                    ,
                    updateReplySubmit: function () {
                        var that = this;
                        $.ajax({
                            url: "/reply/update",
                            data: {
                                replyId: this.updateReply.replyId,
                                userId: this.updateReply.userId,
                                content: this.updateReply.content,
                                anonymous: this.updateReply.anonymous
                            },
                            type: "post",
                            dataType: "json",
                            success: function (data) {
                                if (data.errCode != null) {
                                    alert("失败,errCode=" + data.errCode);
                                    return;
                                }
                                alert("成功")
                                $("#updateReplyModal").modal('hide')
                                that.getReplyList()
                            }
                        })
                    }
                    ,
                    showLongContent: function () {
                        $("#longContentModal").modal();

                    },
                    navToLevel2Reply: function (replyId) {
                        location.href = "/reply/detail?replyId=" + replyId + "&level=2";
                    }
                }
            })
            ;
</script>
