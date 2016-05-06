$(function(){
	$.ajax
({
	url:'/test',
	method:'GET',
	data: {},
	success:
			function(response)
			{
				console.log("test from ajax"+response);
				for (var i = 0; i < response.length; i++)
				{
					var row='<tr><td>'+response[i].name+'</td><td>'+response[i].price+'</td><td>'+response[i].description+'</td><td><a href="/update?id='+response[i].id+'">Edit</a></td><td><a href="/delete?id='+response[i].id+'">Delete</a></td></tr>';
					$("#data").append(row);
				}
				
			},
	dataType: 'json'		

});


})
