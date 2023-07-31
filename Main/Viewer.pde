
class Viewer {
    private color backgroundColor = #000000;
    private color textColor = #ffffff;
    private int volNum = 1;
    private String title = "onk VLog";
    private final int w = 1920;
    private final int h = 1080;
    private float previewRatio = 0.3;
    private PFont titleFont;
    private PFont volFont;
    private int fontSize = 30;
    
    Viewer() {
      titleFont = createFont("GillSans-Bold", fontSize);
      volFont = createFont("Avenir-Heavy", fontSize);
    }
    
    private void draw(float offsetX, float offsetY) {
      pushMatrix();
      //scale(0.5);
      translate(offsetX, offsetY);
      
      fill(this.backgroundColor);
      stroke(this.backgroundColor);
      rect(0, 0, w, h);

      textAlign(CENTER, CENTER);
      fill(this.textColor);
      noStroke();
      
      
      textFont(titleFont);
      text(this.title, w / 2, 230);
      
      textFont(volFont);
      text("vol." + this.volNum, w / 2, this.h - 230);
      
      popMatrix();
    }
    
    public void preview(float offsetX, float offsetY) {
      pushMatrix();
      scale(previewRatio, previewRatio);
      this.draw(offsetX, offsetY);
      popMatrix();
    }
    
    public String getSaveFileName() {
      return "./onkVLog_Eyecatch_Maker_out/eyecatch_vol" 
      + volNum   
      + backgroundColor
      + textColor
      + ".png";
    }
    
    public void fullview() {
      pushMatrix();
      this.draw(0, 0);
      popMatrix();
    }
    
    public void setBackgroundColor(color c) {
        this.backgroundColor = c;
    }
    
    public void setTextColor(color c) {
        this.textColor = c;
    }
    
    public void setVolNum(int v) {
      this.volNum = v;
    }
}
