<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!-- *********  極重要!!! 不可以缺漏  ******** -->
    <!-- //////每隻jsp 的最後面 : Script+</body> +</html>////// -->
       <!--  ============ 其他補充功能 ============= -->
    <!-- DataTable -->
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
    <!--   jQuery   -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
    
	<!--  ====================== 前台套版 ============= -->
    <!-- Main jQuery -->
    <script src="./source/plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="./source/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap Touchpin -->
    <script src="./source/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="./source/plugins/instafeed/instafeed.min.js"></script>
    <!-- Video Lightbox Plugin -->
    <script src="./source/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
    <!-- Count Down Js -->
    <script src="./source/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

    <!-- slick Carousel -->
    <script src="./source/plugins/slick/slick.min.js"></script>
    <script src="./source/plugins/slick/slick-animation.min.js"></script>

    <!-- Google Mapl -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
    <script type="text/javascript" src="./source/plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="./source/js/script.js"></script>
    
    <!--  ====================== 後台套版 /CSS 會相撞 可能無法用============= -->

    
    <!--   SweetAlert(https://sweetalert2.github.io/#examples)   -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<!--   Core JS Files   -->
	<script src="./assets/js/core/popper.min.js"></script>
	<script src="./assets/js/core/bootstrap.min.js"></script>
	<script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script src="./assets/js/plugins/chartjs.min.js"></script>
	<script>
		var ctx1 = document.getElementById("chart-line").getContext("2d");

		var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

		gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
		gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
		gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
		new Chart(ctx1, {
			type : "line",
			data : {
				labels : [ "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
						"Nov", "Dec" ],
				datasets : [ {
					label : "Mobile apps",
					tension : 0.4,
					borderWidth : 0,
					pointRadius : 0,
					borderColor : "#5e72e4",
					backgroundColor : gradientStroke1,
					borderWidth : 3,
					fill : true,
					data : [ 50, 40, 300, 220, 500, 250, 400, 230, 500 ],
					maxBarThickness : 6

				} ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				plugins : {
					legend : {
						display : false,
					}
				},
				interaction : {
					intersect : false,
					mode : 'index',
				},
				scales : {
					y : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							padding : 10,
							color : '#fbfbfb',
							font : {
								size : 11,
								family : "Open Sans",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
					x : {
						grid : {
							drawBorder : false,
							display : false,
							drawOnChartArea : false,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							color : '#ccc',
							padding : 20,
							font : {
								size : 11,
								family : "Open Sans",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
				},
			},
		});
	</script>
	<script>
		var win = navigator.platform.indexOf('Win') > -1;
		if (win && document.querySelector('#sidenav-scrollbar')) {
			var options = {
				damping : '0.5'
			}
			Scrollbar.init(document.querySelector('#sidenav-scrollbar'),
					options);
		}
	</script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="./assets/js/argon-dashboard.min.js?v=2.0.4"></script>


