document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("myCanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");

  // Squares
  ctx.fillStyle = "blue";
  // ctx.fillRect(0, 0, 500, 500);
  ctx.fillRect(25, 25, 500, 500);
  ctx.clearRect(45, 45, 60, 60);
  ctx.strokeRect(50, 50, 50, 50);

  // circles
  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "yellow";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "orange";
  ctx.fill();

  // triangle
  ctx.beginPath();
  ctx.fillStyle = "red";
  ctx.moveTo(200, 100);
  ctx.lineTo(300, 200);
  ctx.lineTo(300, 50);
  ctx.fill();
});
