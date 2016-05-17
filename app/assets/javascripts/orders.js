function addUserToDiv(users){
	var elm;
	var invited = parseInt($('#ordr_invited').val());

	for(var i = 0;i < users.length;i++){
		elm = "<div id=" + users[i].id + " class='row'><h3>" + users[i].email + "</h3>&nbsp;<a href='#' onclick='removeFriend("+users[i].id+")'><i class='fa fa-times'></i></a></div>";
		$('#users-container').append(elm);
		invited++;
		$('#ordr_uids').val($('#ordr_uids').val()+","+users[i].id);
	}
	userIds = ($('#ordr_uids').val()).split(",");
	$('#ordr_invited').val(invited);
}
// --------------------------
function addFriend(){
	var val = $('#invited_atr').val();
	var url = "/user/getFriendId";
	$.ajax({
		url:url,
		method:'GET',
		data:{
			"str": val
		},
		success:function(response){
			if(response.user != null){
				if(getUserIndex(response.user.id) < 0){
					users.push(response.user)
					addUserToDiv([response.user]);
				}
			}
			else
				addFriendsFromGroup();
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

function sayHello(){
  alert ("helllloooooo");
}
