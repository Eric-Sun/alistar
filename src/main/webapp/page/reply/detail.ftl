<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>

<#--<section class="content-header">-->
<#--<ol v-for="(info,index) in reply.levelInfo" class="breadcrumb">-->
<#--<li><a href="#">{{info.id}}</a></li>-->
<#--</ol>-->
<#--</section>-->
    <div id="level2ReplyDiv">
        <section class="content-header">
            <h1>
                回复详情页面
            </h1>

            <ol class="breadcrumb">
                <li v-for="(info,index) in reply.levelInfo" class="active">
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
                                回复用户
                            </div>
                            <div class="col-md-10">
                                {{reply.userName}}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                回复内容
                            </div>
                            <div class="col-md-10" style="word-wrap: break-word;word-break: break-all;">
                                {{reply.content}}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                帖子附图
                            </div>
                            <div v-if="reply.imgList.length==0" class="col-md-10">
                                无图
                            </div>
                            <div v-if="reply.imgList.length!=0" class="col-md-10">
                                <a @click.stop="showImgListModal()">{{reply.imgList.length}}张图</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                创建时间
                            </div>
                            <div class="col-md-10">
                                {{reply.createtime}}
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-2">
                                <button class="btn btn-info btn-sm right" v-on:click="showCreateReplyModal">创建新的回复
                                </button>
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
                            <th class="col-md-1">是否附图</th>
                            <th class="col-md-1">是否是匿名</th>
                            <th class="col-md-2">创建时间</th>
                            <th class="col-md-2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="(childReply,index) in reply.replyList">
                            <td class="col-md-1">{{childReply.replyId}}</td>
                            <td class="col-md-1">{{childReply.userName}}</td>
                            <td class="col-md-6">{{childReply.content}}
                                <a style="cursor:pointer" v-on:click="navToLevelReply(childReply.replyId)">
                                    {{childReply.replyListSize}}条回复
                                </a>
                            </td>
                            <td class="col-md-1">
                                <div v-if="childReply.imgList.length==0">无图</div>
                                <a v-if="childReply.imgList.length!=0" @click.stop="showImgListModalForReply(index)">{{childReply.imgList.length}}张图</a>
                            </td>
                            <td class="col-md-1">
                                <div v-if="childReply.anonymous==0">
                                    非匿名
                                </div>
                                <div v-if="childReply.anonymous==1">
                                    匿名
                                </div>
                            </td>
                            <td class="col-md-2">{{childReply.createtime}}</td>
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
                                        <input type="text" class="form-control" name="userId"
                                               v-model="addReply.userId"/>
                                    </div>
                                    <div class="form-group">
                                        <label>回复内容</label>
                                        <textarea class="form-control" cols="80" rows="10" placeholder="Enter ..."
                                                  name="content"
                                                  v-model="addReply.content"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>是否匿名</label>
                                        <select class="form-control" v-model="addReply.anonymous">
                                            <option value="0">否</option>
                                            <option value="1">是</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">上传图片</label>
                                        <div class="control-form">
                                            <p class="help-block">(建议图片格式为：JPEG/BMP/PNG/GIF，大小不超过5M，最多可上传4张)</p>
                                            <ul class="upload-imgs">
                                                <li v-if="addReply.imgList.length>=4 ? false : true">
                                                    <input type="file" class="upload" @change="addImg" ref="inputer"
                                                           multiple accept="image/png,image/jpeg,image/gif,image/jpg"/>
                                                    <a class="add"><i class="iconfont icon-plus"></i>
                                                        <p>点击上传</p></a>
                                                </li>
                                                <li v-for='(img, index) in addReply.imgList'>
                                                    <p class="img"><img :src="getObjectURL(img)"><a class="close"
                                                                                                    @click="delImg(index)">×</a>
                                                    </p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-default">创建</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal" v-on:click="close()">
                                    关闭
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
                                        <input type="text" class="form-control" name="userId"
                                               v-model="updateReply.userId"/>
                                    </div>
                                    <div class="form-group">
                                        <label>回复内容</label>
                                        <textarea class="form-control" cols="80" rows="10" placeholder="Enter ..."
                                                  name="content"
                                                  v-model="updateReply.content"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>是否匿名</label>
                                    <select class="form-control" v-model="updateReply.anonymous">
                                        <option value="0" selected="selected">否</option>
                                        <option value="1">是</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">上传图片</label>
                                    <div class="control-form">
                                        <p class="help-block">(建议图片格式为：JPEG/BMP/PNG/GIF，大小不超过5M，最多可上传4张)</p>
                                        <ul class="upload-imgs">
                                            <li v-if="updateReply.imgList.length>=4 ? false : true">
                                                <input type="file" class="upload" @change="addImgForUpdate"
                                                       ref="updateInputer"
                                                       multiple accept="image/png,image/jpeg,image/gif,image/jpg"/>
                                                <a class="add"><i class="iconfont icon-plus"></i>
                                                    <p>点击上传</p></a>
                                            </li>
                                            <li v-for='(img, index) in updateReply.imgList'>
                                                <p class="img"><img :src="img.url"><a class="close"
                                                                                      @click="delImgForUpdate(index)">×</a>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-default">创建</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal" v-on:click="close()">
                                    关闭
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="showImgListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form @submit.prevent="createPostSubmit" method="post">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">显示附图</h4>
                            </div>
                            <div class="modal-body">
                                <div class="input-group margin">
                                    <div v-for="(img,index) in showImgList" class="form-group form-inline">
                                        <img :src="img.url">
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" v-on:click="close()">
                                    关闭
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
            el: "#level2ReplyDiv",
            data: {
                replyId: "",
                addReply: {anonymous: 0, imgList: []},
                updateReply: {imgList: []},
                reply: {imgList: []},
                level: 2,
                showImgList: []
            },

            created: function () {
                this.replyId = getQueryString("replyId");
                this.getReplyInfo();
                this.level = getQueryString("level");
            }
            ,
            methods: {
                getObjectURL(file) {
                    var url = null;
                    if (window.createObjectURL != undefined) { // basic
                        url = window.createObjectURL(file);
                    } else if (window.URL != undefined) { // mozilla(firefox)
                        url = window.URL.createObjectURL(file);
                    } else if (window.webkitURL != undefined) { // webkit or chrome
                        url = window.webkitURL.createObjectURL(file);
                    }
                    return url;
                },
                delImgForUpdate: function (index) {
                    this.$delete(this.updateReply.imgList, index);
                },
                delImg: function (index) {
                    this.$delete(this.addReply.imgList, index);
                },
                addImgForUpdate: function (event) {
                    let inputDOM = this.$refs.updateInputer;
                    // 通过DOM取文件数据
                    this.fil = inputDOM.files;
                    let oldLen = this.updateReply.imgList.length;
                    let len = this.fil.length + oldLen;
                    console.log(len);
                    if (len > 1) {
                        alert('最多可上传1张，您还可以上传' + (1 - oldLen) + '张');
                        return false;
                    }
                    for (let i = 0; i < this.fil.length; i++) {
                        let size = Math.floor(this.fil[i].size / 1024);
                        if (size > 5 * 1024 * 1024) {
                            alert('请选择5M以内的图片！');
                            return false
                        }
                        // this.$set(this.imgs, this.imgs.length, this.imgs);
                        this.uploadImage(this.fil[i], 1);
                    }
                },
                /**
                 * 0 为添加，1为更新
                 * @param file
                 * @param type
                 */
                uploadImage(file, type) {
                    var formData = new FormData();
                    formData.append("file", file);
                    var that = this;
                    $.ajax({
                        url: '/image/upload',
                        data: formData,
                        dataType: "json",
                        type: "post",
                        contentType: 'multipart/form-data',
                        contentType: false,
                        processData: false,
                        success: function (data) {
                            file.imgId = data.imgId;
                            file.url = data.url;
                            if (type == 0) {
                                that.addReply.imgList.push(file);
                            } else {
                                that.updateReply.imgList.push(file);
                            }
                        }
                    });
                },
                addImg(event) {
                    let inputDOM = this.$refs.inputer;
                    // 通过DOM取文件数据
                    this.fil = inputDOM.files;
                    let oldLen = this.addReply.imgList.length;
                    let len = this.fil.length + oldLen;
                    if (len > 1) {
                        alert('最多可上传1张，您还可以上传' + (1 - oldLen) + '张');
                        return false;
                    }
                    for (let i = 0; i < this.fil.length; i++) {
                        let size = Math.floor(this.fil[i].size / 1024);
                        if (size > 5 * 1024 * 1024) {
                            alert('请选择5M以内的图片！');
                            return false
                        }
                        // this.$set(this.imgs, this.imgs.length, this.imgs);
                        this.uploadImage(this.fil[i], 0);
                    }
                },

                showImgListModalForReply: function (index) {
                    this.showImgList = this.reply.replyList[index].imgList;
                    $("#showImgListModal").modal();
                },
                showImgListModal: function () {
                    this.showImgList = this.reply.imgList;
                    $("#showImgListModal").modal();
                },
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
                getReplyInfo: function () {
                    var that = this;
                    $.ajax({
                        url: "/reply/getReply",
                        data: {
                            replyId: this.replyId
                        },
                        dataType: "json",
                        success: function (data) {
                            console.log(JSON.stringify(data));
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            that.reply = data;
                        }
                    })
                }

                ,
                showCreateReplyModal: function () {
                    this.addReply.content = '';
                    this.addReply.anonymous = 0;
                    this.addReply.userId = '';
                    $("#createReplyModal").modal();
                }
                ,
                createReplySubmit: function () {
                    var that = this;
                    var imgIdList = []
                    for (var i = 0; i < this.addReply.imgList.length; i++) {
                        imgIdList.push(this.addReply.imgList[i].imgId);
                    }
                    $.ajax({
                        url: "/reply/create",
                        data: {
                            userId: this.addReply.userId,
                            content: this.addReply.content,
                            postId: this.reply.postId,
                            barId: this.reply.barId,
                            anonymous: this.addReply.anonymous,
                            lastReplyId: this.replyId,
                            imgListStr: JSON.stringify(imgIdList)
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
                            that.getReplyInfo();
                        }
                    })

                }
                ,
                deleteReply: function (index) {
                    var replyId = this.reply.replyList[index].replyId;
                    var that = this;
                    $.ajax({
                        url: "/reply/delete",
                        data: {
                            replyId: replyId,
                            postId: this.reply.postId
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            alert("成功")
                            that.reply.replyList.splice(index, 1);
                        }
                    })
                }
                ,
                showUpdateReplyModal: function (index) {
                    var replyId = this.reply.replyList[index].replyId;
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
                    var imgIdList = []
                    for (var i = 0; i < this.updateReply.imgList.length; i++) {
                        imgIdList.push(this.updateReply.imgList[i].imgId);
                    }
                    $.ajax({
                        url: "/reply/update",
                        data: {
                            replyId: this.updateReply.replyId,
                            userId: this.updateReply.userId,
                            content: this.updateReply.content,
                            anonymous: this.updateReply.anonymous,
                            imgListStr: JSON.stringify(imgIdList)
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
                            that.getReplyInfo()
                        }
                    })
                }
                ,
                showLongContent: function () {
                    $("#longContentModal").modal();

                },
                navToLevelReply: function (replyId) {
                    location.href = "/reply/detail?replyId=" + replyId + "&level=3";
                }
            }
        })
    ;
</script>
<style>
    .upload-imgs {
        margin: 10px 0 30px 0;
        overflow: hidden;
        font-size: 0;
    }

    .upload-imgs li {
        position: relative;
        width: 118px;
        height: 118px;
        font-size: 14px;
        display: inline-block;
        padding: 10px;
        margin-right: 25px;
        border: 2px dashed #ccc;
        text-align: center;
        vertical-align: middle;
    }

    .upload-imgs li:hover {
        border-color: #ffffff;
    }

    .upload-imgs .add {
        display: block;
        background-color: #ccc;
        color: #ffffff;
        height: 94px;
        padding: 8px 0;
    }

    .upload-imgs .add .iconfont {
        padding: 10px 0;
        font-size: 40px;
    }

    .upload-imgs li:hover .add {
        background-color: #ffffff;
    }

    .upload-imgs li .upload {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        width: 118px;
        height: 118px;
    }

    .upload-imgs .img {
        position: relative;
        width: 94px;
        height: 94px;
        line-height: 94px;
    }

    .upload-imgs .img img {
        vertical-align: middle;
        width: 94px;
        height: 94px;
    }

    .upload-imgs .img .close {
        display: none;
    }

    .upload-imgs li:hover .img .close {
        display: block;
        position: absolute;
        right: -6px;
        top: -10px;
        line-height: 1;
        font-size: 22px;
        color: #aaa;
    }
</style>
