import controlP5.*;
import java.lang.*;

App app;

void setup() {
  size(600, 600);
  
  colorMode( HSB, 360, 100, 100 );
  pixelDensity(displayDensity());
  
  ControlP5 cp5 = new ControlP5(this);
  app = new App(cp5);
}

void draw() {
  app.run();

  if (app.canSave()) {
    app.saveView();
    app.endSaveMode();
  }
  
  textAlign(LEFT, BOTTOM);
  fill(#000000);
  textFont(createFont("Arial", 10));     
  text("(C) 2023 onkVLog.", 20, 580); 
}

public void controlEvent(ControlEvent event) {
  //println(event.getController().getName());
  switch(event.getController().getName()) {
    case "saveBtn" : 
      app.beginSaveMode();
      break;
    case "bgHueSlider" :
    case "bgSatSlider" :
    case "bgBriSlider" :
      app.changeBgSlider();
      break;
    case "txtHueSlider" :
    case "txtSatSlider" :
    case "txtBriSlider" :
      app.changeTextSlider();
      break;
    //default:
      //break;
  }
  app.clickDefColorBtn(event.getController().getName());
}

void keyPressed(){
  switch (key){
    case 's': app.beginSaveMode(); break;
    case ESC: key=0; break;
  }
}

void keyReleased() {
  app.changeTextField();
  app.changeBgFiled();      
  app.changeVol();
}

class App {
  private Viewer viewer;
  private Controller controller;
  private PSurface psf = getSurface();
  private boolean isSaveMode = false;
  private int saveFrameNum = 0;
  private String alertMsg = "";
  
  App(ControlP5 cp5) {
    this.viewer = new Viewer();
    this.controller = new Controller(cp5);
    this.psf.setTitle("onk VLog Eyecacth Maker");
  }
  
  public void run() {
    if(!isSaveMode) {
      background(0, 0, 80);
      
      this.controller.updateSliderColor();
      this.viewer.preview(40, 50);
      this.controller.show();
      
      if(this.alertMsg != "") {
        fill(#ff0000);
        text(this.alertMsg, 20, 540);
      }
    } 
    // save mode
    else {
      //println("run() save mode");
      this.psf.setResizable(true);
      this.psf.setSize(1920, 1080);
      this.viewer.fullview();
      this.controller.hide();
    }
  }  
  
  public void changeBgSlider() {
    color backgroundColor = this.controller.getBgSliderValue();
    this.controller.setBgFieldValue(backgroundColor);
    this.viewer.setBackgroundColor(backgroundColor);
  }
  
  public void changeBgFiled() {
    try {
      color backgroundColor = this.controller.getBgFieldValue();
      this.controller.setBgSliderValue(backgroundColor);
      this.viewer.setBackgroundColor(backgroundColor);
      this.alertMsg = "";
    } catch (Exception e) {
      this.alertMsg = e.getMessage();
    }
    
  }
  
  public void changeTextSlider() {
    color backgroundColor = this.controller.getTextSliderValue();
    this.controller.setTextFieldValue(backgroundColor);
    this.viewer.setTextColor(backgroundColor);
  }
  
  public void changeTextField() {
    try {
      color backgroundColor = this.controller.getTextFieldValue();
      this.controller.setTextSliderValue(backgroundColor);
      this.viewer.setBackgroundColor(backgroundColor);
      this.alertMsg = "";
    } catch (Exception e) {
      this.alertMsg = e.getMessage();
    }
  }
  
  public void changeVol() {
    int vol = this.controller.getVol();
    this.viewer.setVolNum(vol);
  }
  
  public void beginSaveMode() {
    //println("beginSaveMode()");
    this.isSaveMode = true;
    this.saveFrameNum = frameCount + 2;
  }
  
  public void endSaveMode() {
    //println("endSaveMode");
    this.isSaveMode = false;
    this.psf.setSize(600, 600);
    this.psf.setResizable(false);
  }
  
  public void saveView() {
    //println("saveView()");
    save(viewer.getSaveFileName());
  }
  
  public boolean canSave() {
    return app.saveFrameNum == frameCount;
  }
   
  public void clickDefColorBtn(String targetName) {
    this.controller.clickDefColorBtn(targetName);
  }
}
