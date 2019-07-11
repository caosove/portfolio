<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<script>
	//해당지역의 건축물대장
	function getgunchuck(aa) {

		var num = aa;
		var bCate = $('#rightView_bCate').html();
		var bZone = $('#rightView_bZone').html();
		console.log(bCate);
		console.log(bZone);
		console.log(num);
		
		var markers = [];
		var infowindows = [];
		var marker;
		var infowindow;
		
		for (var i = 0; i < gongdonglist.length; i++) {
			gongdonglist[i].setMap(null);
		}
		

		$
				.ajax({
					type : 'POST',
					url : './GunchuckListbybArea',
					//dataType: "json",
					data : {
						bCate : bCate,
						bZone : bZone,
						num : num
					},
					success : function(data) {
						var result = data;
						var i;

						for (i = 0; i < result.length; i++) {

							console.log(result.length);
							var markerOptions = addMarkerOptionGunchuck(
									result[i].gunXposition,
									result[i].gunYposition);

							marker = new naver.maps.Marker(markerOptions);

							markers.push(marker);
							gongdonglist.push(marker);

						}
						for (var c = 0; c < markers.length; c++) {
							naver.maps.Event.addListener(markers[c],
									'click', getClickHandler(c, markers,
											infowindows));
						}
					}
				});

	}

	}
	
	</script>
