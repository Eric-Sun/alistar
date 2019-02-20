<#import "layouts/layout.ftl" as layout />
<@layout.mainLayout>
<section class="content">
    <div class="col-md-9">
        <div class="box box-primary">
            <div class="box-body">
                <form action="/post/update?postId=${post.postId}&barId=${barId}" method="post">
                    <div class="input-group margin">


                        <div class="form-group form-inline">
                            <label>发帖人用户id</label>
                            <input type="text" class="form-control" name="userId" value="${post.userId}"/>
                        </div>
                        <div class="form-group">
                            <label>帖子内容</label>
                            <textarea class="form-control" rows="3" placeholder="Enter ..." name="content">${post.content}</textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary"
                                    onclick="this.parentNode.submit(); return false;">更新
                            </button>
                        </div>
                    </div>
            </div>
            </form>
            <!-- /input-group -->
        </div>
    </div>
    </div>
</section>
</@layout.mainLayout>
<script type="text/javascript">
    $(function () {
                $("#begin").datepicker().datepicker("option", {
                    "dateFormat": "yy-mm-dd"
                });
                ;
            }
    );
</script>
