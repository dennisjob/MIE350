<div class="modal" id="PostsAdd">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"></h4>
                <div class="container">
                    <h2>Create a New Post</h2>
                    <br>
                    <form action="posts">
                       <div class="form-group">
                       <input type='hidden' name='action' value='create'/>
                       <input type='hidden' name='groupId' value='${curGroup.getGroupId()}'/>
                         <label for="content">Enter the Content of the Post</label>
                         <textarea type="content" class="form-control" placeholder="Enter Post Content" id="content" name="content" required></textarea>
                       	 <label for="url">Enter a Link</label>
                         <input type="url" class="form-control" placeholder="Enter Link" id="url" name="url"></textarea>
                       </div>
                       <button type="submit" class="btn btn-primary">Submit</button>
                     </form>
                </div>
             </div>
         </div>
     </div>
</div>