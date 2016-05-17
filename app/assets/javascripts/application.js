// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require autocomplete-rails
//= require underscore
//= require json2
//= require judge
//= require_tree .


var users = [];
var userIds = [];

function getUserIndex(id){
	for(var i = 0; i < users.length; i++){
		if(users[i].id == id)
			return i;
	}
	return -1;
}

function autocomplet_friend() {
    var min_length = 0; // min characters to display the autocomplete
    var keyword = $('#invited_atr').val();
    var url = '/users/getFriendList';
    if (keyword.length >= min_length) {
        $.ajax({
            url: url,
            type: 'GET',
            data: {keyword:keyword},
            success:function(data){
            	$('#contacts').empty();
                if(data.emails.length > 0) {
                    for(var i = 0; i < data.emails.length; i++){
                    	$('#contacts').append("<option value='"+data.emails[i]+"'>");
                    }
                }else
                    autocomplet_group();
            }
        });
    } else {
        $('#local_list_id').hide();
    }
}
//-------------------- Orders Js--------------------- //
function addFriend(){
	var val = $('#invited_atr').val();
	var url = "/users/getFriendId";
	$.ajax({
		url:url,
		method:'GET',
		data:{
			"femail": val
		},
		success:function(response){
			if(response.user != null){
				if(getUserIndex(response.user.id) < 0){
					users.push(response.user)
					addUserToDiv([response.user]);
				}
			}
			else
				console.console.log("Null response");
		},
		error:function(err,status,error){
			console.log(error);
		},
		complete:function(complete){
			console.log("complete");
		},
		dataType:'json'
	});
}
//--------------------- Add Friend to div --------------
function addUserToDiv(users){
	var elm;
	var invited = parseInt($('#ordr_invited').val());

	for(var i = 0;i < users.length;i++){
		elm = "<div id=" + users[i].id + " class='row'><h3>" + users[i].email + "</h3>&nbsp;<a href='#' onclick='removeFriend("+users[i].id+")'><i class='fa fa-times'></i></a></div>";
		$('#invited_frnds').append(elm);
		invited++;
		$('#ordr_uids').val($('#ordr_uids').val()+","+users[i].id);
	}
	userIds = ($('#ordr_uids').val()).split(",");
	$('#ordr_invited').val(invited);
}
//-------------------- 
