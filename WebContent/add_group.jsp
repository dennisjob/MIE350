<!-- ADD GROUP MODAL-->
<div class="modal" id="GroupsAdd">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"></h4>
                <div class="container">
                    <h2>Edit Groups</h2>
                    <br>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#CreateGroup">Create Group</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#JoinGroup">Join Group</a>
                      </li>
                    </ul>
                  
                    <!-- Tab panes -->
                    <div class="tab-content">
                      <div id="CreateGroup" class="container tab-pane active"><br>
                        <h3>Create Group</h3>
                        <p><form action="groups">
                            <div class="form-group">
                              <input type='hidden' name='action' value='create'/>
                              <label for="GroupName">Start your own group!</label>
                              <input type="GroupName" class="form-control" placeholder="Enter Group Name" id="GroupName" name="name" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                          </form></p>
                      </div>
                      <div id="JoinGroup" class="container tab-pane fade"><br>
                        <h3>Join Group</h3>
                        <p><form action="groups">
                            <div class="form-group">
                            <input type='hidden' name='action' value='addMember'/>
                              <label for="JoinGroup">Join a new Group!</label>
                              <input type="JoinGroup" class="form-control" placeholder="Enter Group Join Code" id="code">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                          </form></div>
                    </div>
                  </div>
            </div>
        </div>
    </div>
</div>