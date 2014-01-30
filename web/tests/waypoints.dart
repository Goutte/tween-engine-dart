part of tweenengine.tests;

class Waypoints extends Test{
  Vector2 pos;
  
  Waypoints(CanvasRenderingContext2D context): super(context);
  
  initialize(){
    
    pos = new Vector2(50, 30);
    
    this.title = "Waypoints";
    this.info = """Tweens can navigate through waypoints, which define a 'bezier' path (here 
                    using a Catmull-Rom spline).""";
    
    Tween.to(pos, VectorAccessor.XY, 3)
      ..waypoint = [200,100]
      ..waypoint = [150, 150]
      ..waypoint = [180, 180]
      ..waypoint = [380, 50]
      ..targetValues = [350, 250]
      ..easing = Quad.INOUT
      ..path = TweenPaths.catmullRom
      ..repeatYoyo(Tween.INFINITY, 0.2)
      ..delay = 0.5
      ..start(_tweenManager);
  }
  
  render(num delta){
    super.render(delta);
    _tweenManager.update(delta);

    context
      ..beginPath()
      ..rect(pos.x, pos.y, 20, 20)
      ..fillStyle = 'yellow'
      ..fill()
      ..lineWidth = 1
      ..strokeStyle = 'white'
      ..stroke();
  }
  
  dispose(){
    _tweenManager.killAll();
  }
  
}