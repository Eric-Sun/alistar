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
                        <div class="row">
                            <div class="col-md-5">
                                <input type="text" v-model="queryData"/>
                            </div>
                            <div class="col-md-7">
                                <button type="button" v-on:click="queryTitle">搜索标题</button>
                                <button type="button" v-on:click="queryUserId">搜索用户id</button>
                            </div>

                        </div>


                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>帖子id</th>
                                    <th>发帖人</th>
                                    <th>帖子标题</th>
                                    <th>帖子内容</th>
                                    <th>帖子状态</th>
                                    <th>是否匿名</th>
                                    <th>帖子类型</th>
                                    <th>创建时间</th>
                                    <th>最后更新时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr v-for="(post,index) in postList">
                                    <td>{{post.postId}}</td>
                                    <td>{{post.userName}}</td>
                                    <td>{{post.title}}</td>
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
                                    <td>
                                        <div v-if="post.status==0">
                                            上线
                                        </div>
                                        <div v-else>
                                            下线
                                        </div>
                                    </td>
                                    <td>
                                        <div v-if="post.anonymous==0">
                                            非匿名
                                        </div>
                                        <div v-else>
                                            匿名
                                        </div>
                                    </td>
                                    <td>
                                        <div v-if="post.type==0">
                                            故事贴
                                        </div>
                                        <div v-else>
                                            一日一记
                                        </div>
                                    </td>
                                    <td>{{post.createtime}}</td>
                                    <td>{{post.updatetime}}</td>
                                    <td>
                                        <div v-if="post.status==0">
                                            <button class="btn btn-info btn-sm right"
                                                    v-on:click="offline(index)">
                                                下线
                                            </button>
                                        </div>
                                        <div v-if="post.status==1">
                                            <button class="btn btn-info btn-sm right"
                                                    v-on:click="online(index)">
                                                上线
                                            </button>
                                        </div>

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
                                <div class="form-group form-inline">
                                    <label>标题</label>
                                    <input type="text" class="form-control" name="title" v-model="title"/>
                                </div>
                                <div class="form-group">
                                    <label>帖子内容</label>
                                    <textarea class="form-control" cols="80" rows="10" placeholder="Enter ..."
                                              name="content"
                                              v-model="content"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>是否匿名</label>
                                    <select class="form-control" v-model="anonymous">
                                        <option value="0">否</option>
                                        <option value="1">是</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>帖子类型</label>
                                    <select class="form-control" v-model="type">
                                        <option value="0">故事贴</option>
                                        <option value="1">一日一记</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">上传图片</label>
                                    <div class="control-form">
                                        <p class="help-block">(建议图片格式为：JPEG/BMP/PNG/GIF，大小不超过5M，最多可上传4张)</p>
                                        <ul class="upload-imgs">
                                            <li v-if="imgs.length>=4 ? false : true">
                                                <input type="file" class="upload" @change="addImg" ref="inputer"
                                                       multiple accept="image/png,image/jpeg,image/gif,image/jpg"/>
                                                <a class="add"><i class="iconfont icon-plus"></i>
                                                    <p>点击上传</p></a>
                                            </li>
                                            <li v-for='(img, index) in imgs'>
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
                                <div class="form-group form-inline">
                                    <label>标题</label>
                                    <input type="text" class="form-control" name="title" v-model="updatePost.title"
                                    />
                                </div>
                                <div class="form-group">
                                    <label>帖子内容</label>
                                    <textarea class="form-control" cols="80" rows="10" placeholder="Enter ..."
                                              name="content"
                                              v-model="updatePost.content"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>是否匿名</label>
                                    <select class="form-control" v-model="updatePost.anonymous">
                                        <option value="0">否</option>
                                        <option value="1">是</option>
                                    </select>
                                </div>


                            </div>
                            <div class="form-group">
                                <label>帖子类型</label>
                                <div v-if="updatePost.type==0">故事贴</div>
                                <div v-else>一日一记</div>
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
<style type="text/css">
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
<script type="text/javascript">
    var postList = new Vue({
            el: "#postList",
            data: {
                barName: "",
                postList: [],
                barId: 0,
                content: "",
                title: "",
                type: "",
                anonymous: "",
                userId: "",
                updatePost: {},
                longContent: "",
                queryData: "",
                formData: new FormData(),
                imgs: []
            },
            created: function () {
                this.barId = getQueryString("barId");
                this.getPostList();
            },
            methods: {
                addImg(event) {
                    let inputDOM = this.$refs.inputer;
                    // 通过DOM取文件数据
                    this.fil = inputDOM.files;
                    let oldLen = this.imgLen;
                    let len = this.fil.length + oldLen;
                    if (len > 4) {
                        alert('最多可上传4张，您还可以上传' + (4 - oldLen) + '张');
                        return false;
                    }
                    for (let i = 0; i < this.fil.length; i++) {
                        let size = Math.floor(this.fil[i].size / 1024);
                        if (size > 5 * 1024 * 1024) {
                            alert('请选择5M以内的图片！');
                            return false
                        }
                        this.imgs.push(this.fil[i]);
                        // this.$set(this.imgs, this.imgs.length, this.imgs);
                        this.uploadImage(this.fil[i]);
                    }
                },
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
                delImg(index) {
                    this.$delete(this.imgs, index);
                },
                uploadImage( file) {
                    var formData = new FormData();
                    formData.append("file", file);
                    $.ajax({
                        url: '/image/upload',
                        data: formData,
                        dataType: "json",
                        type: "post",
                        contentType: 'multipart/form-data',
                        contentType: false,
                        processData: false,
                        success: function (data) {
                            console.log(data);
                        }
                    });
                },
                createPostSubmit: function () {
                    var that = this;
                    $.ajax({
                        url: "/post/create",
                        data: {
                            barId: this.barId,
                            content: this.content,
                            userId: this.userId,
                            title: this.title,
                            anonymous: this.anonymous,
                            type: this.type
                        },
                        type: "post",
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            alert("创建成功");
                            $("#createPostModal").modal('hide');
                            that.getPostList();
                        }
                    });
                }
                ,
                getPostList: function () {
                    var that = this;
                    $.ajax({
                        url: "/post/getPostList",
                        data: {
                            barId: this.barId
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            that.postList = data.postList;
                            that.barName = data.barName;
                        },
                        error: function (data) {
                            alert(JSON.stringify(data));
                        }
                    });
                }
                ,
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
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            alert("成功");
                            that.postList.splice(index, 1);
                        }
                    })
                }
                ,
                showCreatePostModal: function () {
                    $("#createPostModal").modal();
                    this.title = "";
                    this.userId = "";
                    this.content = "";
                }
                ,
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
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            that.updatePost = data;
                        }
                    })
                }
                ,
                navToPostDetail: function (index) {
                    var postId = this.postList[index].postId;
                    location.href = "/post/detail?postId=" + postId + "&barId=" + this.barId;
                }
                ,
                updatePostSubmit: function () {
                    var that = this;
                    $.ajax({
                        url: "/post/update",
                        data: {
                            postId: this.updatePost.postId,
                            content: this.updatePost.content,
                            title: this.updatePost.title,
                            anonymous: this.updatePost.anonymous,
                            type: this.updatePost.type
                        },
                        type: "post",
                        dataType: "json",
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            alert("更新成功")
                            $("#updatePostModal").modal('hide');
                            that.getPostList();
                        }
                    })
                }
                ,
                showLongContent: function (index) {
                    $("#longContentModal").modal();
                    this.longContent = this.postList[index].content;
                }
                ,
                offline: function (index) {
                    var postId = this.postList[index].postId;
                    var that = this;
                    $.ajax({
                        url: "/post/offline",
                        data: {
                            postId: postId
                        },
                        type: "post",
                        dataType: "json",
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            alert("下线成功");
                            that.getPostList();
                        }
                    })
                }
                ,
                online: function (index) {
                    var postId = this.postList[index].postId;
                    var that = this;
                    $.ajax({
                        url: "/post/online",
                        data: {
                            postId: postId
                        },
                        type: "post",
                        dataType: "json",
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            alert("上线成功");
                            that.getPostList();
                        }
                    })
                }
                ,
                queryTitle: function () {
                    var that = this;
                    $.ajax({
                        url: "/post/queryTitle",
                        data: {
                            barId: this.barId,
                            name: this.queryData
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            that.postList = data;
                        },
                        error: function (data) {
                            alert(JSON.stringify(data));
                        }
                    });
                }
                ,
                queryUserId: function () {
                    var that = this;
                    $.ajax({
                        url: "/post/queryUserId",
                        data: {
                            barId: this.barId,
                            userId: this.queryData
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.errCode != null) {
                                alert("失败,errCode=" + data.errCode);
                                return;
                            }
                            that.postList = data;
                        },
                        error: function (data) {
                            alert(JSON.stringify(data));
                        }
                    });
                }
            }

        })
    ;

</script>