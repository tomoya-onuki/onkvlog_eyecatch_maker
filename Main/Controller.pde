import controlP5.*;
import java.lang.*;

class Controller {
    public Slider bgHueSlider;
    public Slider bgSatSlider;
    public Slider bgBriSlider;
    public Slider textHueSlider;
    public Slider textSatSlider;
    public Slider textBriSlider;
    public Button saveBtn;
    public Textfield volTextFiled;
    public Textfield bgColorTextFiled;
    public Textfield textColorTextFiled;
    private int sliderW = 180;
    private int sliderH = 30;
    private int sliderMargin = 10;
    private PFont labelFont;
    private PFont p5Font = createFont("Arial", 5);
    private color[] defaultColorSet = {
      #EEF8FF, #C9E7FD, #8BBDDA, 
      #F7D19C, #FFE796, #FFEACC,
      #54A8A7, #407F54, #6A8CB7,
      #AE000E, #454545, #F7F7F7
    };
    private Button[] bgDefaultColorBtnList = new Button[12];
    private Button[] textDefaultColorBtnList = new Button[12];
    private String[] bgDefaultColorBtnNameList = new String[12];
    private String[] textDefaultColorBtnNameList = new String[12];
    
    
    Controller(ControlP5 cp5) {
      
      //this.hex2color("#000000");
      
      this.drawLabels();
      colorMode( HSB, 360, 100, 100 );
      bgHueSlider = cp5.addSlider("bgHueSlider")
                      .setPosition(20, 380)
                      .setSize(sliderW, sliderH)
                      .setFont(p5Font)
                      .setMax(360)
                      .setMin(0)
                      .setLabel("Hue")
                      .setColorCaptionLabel(0) 
                      .setValue(0);
                      
      bgSatSlider = cp5.addSlider("bgSatSlider")
                      .setPosition(20, 380 + sliderH + sliderMargin)
                      .setSize(sliderW, sliderH)
                      .setFont(p5Font)
                      .setMax(100)
                      .setMin(0)
                      .setLabel("Saturation")
                      .setColorCaptionLabel(0) 
                      .setColorForeground(color(80))
                      .setColorBackground(color(40))
                      .setColorActive(color(100))
                      .setValue(0);
                      
      bgBriSlider = cp5.addSlider("bgBriSlider")
                      .setPosition(20, 380 + (sliderH + sliderMargin) * 2)
                      .setSize(sliderW, sliderH)
                      .setFont(p5Font)
                      .setMax(100)
                      .setMin(0)
                      .setLabel("Brightness")
                      .setColorCaptionLabel(0) 
                      .setColorForeground(color(80))
                      .setColorBackground(color(40))
                      .setColorActive(color(100))
                      .setValue(0);
    
                       
      
      
      textHueSlider = cp5.addSlider("txtHueSlider")
                      .setPosition(320, 380)
                      .setSize(sliderW, sliderH)
                      .setFont(p5Font)
                      .setMax(360)
                      .setMin(0)
                      .setLabel("Hue")
                      .setColorCaptionLabel(0) 
                      .setValue(0);
                      
      textSatSlider = cp5.addSlider("txtSatSlider")
                      .setPosition(320, 380 + sliderH + sliderMargin)
                      .setSize(sliderW, sliderH)
                      .setFont(p5Font)
                      .setMax(200)
                      .setMin(0)
                      .setLabel("Saturation")
                      .setColorCaptionLabel(0) 
                      .setColorForeground(color(80))
                      .setColorBackground(color(40))
                      .setColorActive(color(100))
                      .setValue(0);
                      
      textBriSlider = cp5.addSlider("txtBriSlider")
                      .setPosition(320, 380 + (sliderH + sliderMargin) * 2)
                      .setSize(sliderW, sliderH)
                      .setFont(p5Font)
                      .setMax(100)
                      .setMin(0)
                      .setLabel("Brightness")
                      .setColorCaptionLabel(0) 
                      .setColorForeground(color(80))
                      .setColorBackground(color(40))
                      .setColorActive(color(100))
                      .setValue(100);
          
                        
                        
      bgColorTextFiled = cp5.addTextfield("bgHexField")
                       .setCaptionLabel("") 
                       .setPosition(130, 356)
                       .setSize(70,20)
                       .setFont(p5Font)
                       .setColorCaptionLabel(0) 
                       .setColorForeground(color(0, 0, 70))
                       .setColorBackground(color(0, 0, 80))
                       .setColorActive(color(0, 0, 70))
                       .setColor(#000000)
                       .setColorCursor(#000000)
                       .setValue("#000000") 
                       .setAutoClear(false);   
                       
       textColorTextFiled = cp5.addTextfield("txtHexField")
                       .setCaptionLabel("") 
                       .setPosition(430, 356)
                       .setSize(70,20)
                       .setFont(p5Font)
                       .setColorCaptionLabel(0) 
                       .setColorForeground(color(0, 0, 70))
                       .setColorBackground(color(0, 0, 80))
                       .setColorActive(color(0, 0, 70))
                       .setColor(#000000)
                       .setColorCursor(#000000)
                       .setValue("#FFFFFF") 
                       .setAutoClear(false);               
                      
       saveBtn = cp5.addButton("saveBtn")
                    .setValue(0)
                    .setPosition(440, 560)
                    .setSize(130,20) 
                    .setCaptionLabel("SAVE (s)")
                    .setFont(p5Font)
                    .setColorForeground(color(80))
                    .setColorBackground(color(40))
                    .setColorActive(color(100));
      
      
                                     
      volTextFiled = cp5.addTextfield("volField")
                       .setCaptionLabel("") 
                       .setPosition(360, 560)
                       .setSize(60,20)
                       .setFont(p5Font)
                       .setColorCaptionLabel(0) 
                       .setColorForeground(color(80))
                       .setColorBackground(color(40))
                       .setColorActive(color(100))
                       .setValue("1") 
                       .setAutoClear(false);
      
    
      
      for (int i = 0; i < bgDefaultColorBtnList.length; i++) {
        bgDefaultColorBtnNameList[i] = "bgDefColorBtn" + i;
        bgDefaultColorBtnList[i] = cp5.addButton("bgDefColorBtn" + i)
                                  .setCaptionLabel("") 
                                  .setPosition(20 + i * 15, 510)
                                  .setSize(15, 15)
                                  .setColorForeground(defaultColorSet[i])
                                  .setColorBackground(defaultColorSet[i])
                                  .setColorActive(defaultColorSet[i]);
      }
      
      for (int i = 0; i < textDefaultColorBtnList.length; i++) {
        textDefaultColorBtnNameList[i] = "textDefColorBtn" + i;
        textDefaultColorBtnList[i] = cp5.addButton("textDefColorBtn" + i)
                                  .setCaptionLabel("") 
                                  .setPosition(320 + i * 15, 510)
                                  .setSize(15, 15)
                                  .setColorForeground(defaultColorSet[i])
                                  .setColorBackground(defaultColorSet[i])
                                  .setColorActive(defaultColorSet[i]);
      }
    }
    
    public void drawLabels() {
      labelFont = createFont("Arial-Black", 12);
      textFont(labelFont);
      textAlign(LEFT, BOTTOM);
      fill(0, 0, 0);
      noStroke();
      
      text("BACKGROUND", 20, 375);
      text("TEXT", 320, 375);
      
      textAlign(LEFT, TOP);
      text("VOL.", 320, 560);  
      
      
    }
   
    
    public void hide() {
      bgHueSlider.hide();
      bgSatSlider.hide();
      bgBriSlider.hide();
      textHueSlider.hide();
      textSatSlider.hide();
      textBriSlider.hide();
      saveBtn.hide();
    }
    
    
    public void show() {
      this.drawLabels();
      bgHueSlider.show();
      bgSatSlider.show();
      bgBriSlider.show();
      textHueSlider.show();
      textSatSlider.show();
      textBriSlider.show();
      saveBtn.show();
    }
    
    public void updateSliderColor() {
      colorMode( HSB, 360, 100, 100 ); 
      float h = this.bgHueSlider.getValue();
      this.bgHueSlider.setColorForeground(color(h, 45, 100));
      this.bgHueSlider.setColorBackground(color(h, 50, 100));
      this.bgHueSlider.setColorActive(color(h, 80, 100));
      
      
      h = this.textHueSlider.getValue();
      this.textHueSlider.setColorForeground(color(h, 45, 100));
      this.textHueSlider.setColorBackground(color(h, 50, 100));
      this.textHueSlider.setColorActive(color(h, 80, 100));
    }

    public color getBgSliderValue() {
      colorMode( HSB, 360, 100, 100 ); 
      float h = this.bgHueSlider.getValue();
      float s = this.bgSatSlider.getValue();
      float v = this.bgBriSlider.getValue();
      return color(h, s, v);
    }
    
    public void setBgSliderValue(color c) {
      colorMode( HSB, 360, 100, 100 ); 
      //println("setBgSliderValue() => " + hue(c) + ", " + saturation(c) + ", " + brightness(c));
      this.bgHueSlider.setValue(int(hue(c)));
      this.bgSatSlider.setValue(int(saturation(c)));
      this.bgBriSlider.setValue(int(brightness(c)));
    }
    
    public color getTextSliderValue() {
      colorMode( HSB, 360, 100, 100 ); 
      float h = this.textHueSlider.getValue();
      float s = this.textSatSlider.getValue();
      float v = this.textBriSlider.getValue();
      return color(h, s, v);
    } 
    
    public void setTextSliderValue(color c) {
      //println("setTextSliderValue()");
      colorMode( HSB, 360, 100, 100 );  
      this.textHueSlider.setValue(int(hue(c)));
      this.textSatSlider.setValue(int(saturation(c)));
      this.textBriSlider.setValue(int(brightness(c)));
    }
    
    
    public color getBgFieldValue() throws Exception {
      //println("getBgFieldValue()");
      String hex = this.bgColorTextFiled.getText();
      println(hex);
      if (hex.length() == 7) {      
        color c = hex2color(hex);
        return color(c);
      } else {
        throw new Exception("Hex Format error");
      }
    }
    
    public void setBgFieldValue(color c) {
      this.bgColorTextFiled.setValue(color2hex(c));
    }
    
    
    public color getTextFieldValue() throws Exception {
      String hex = this.textColorTextFiled.getText();
      if (hex.length() == 7) {      
        color c = hex2color(hex);
        //println(hex);
        return color(c);
      } else {
        throw new Exception("Hex Format error");
      }
    }
    
    public void setTextFieldValue(color c) {
      this.textColorTextFiled.setValue(color2hex(c));
    }
    
    public void clickDefColorBtn(String targetName) {
      println(targetName);
      boolean isFind = false;
      for(int i = 0; i < this.bgDefaultColorBtnNameList.length; i++) {
        
        if(targetName.equals(this.bgDefaultColorBtnNameList[i])) {
          println("  :" + this.bgDefaultColorBtnNameList[i]);
          this.setBgSliderValue(defaultColorSet[i]);
          this.setBgFieldValue(defaultColorSet[i]);
          isFind = true;
          break;
        }
      }
      if(!isFind) {
        for(int i = 0; i < this.textDefaultColorBtnNameList.length; i++) {
          if(targetName.equals(this.textDefaultColorBtnNameList[i])) {
            this.setTextSliderValue(defaultColorSet[i]);
            this.setTextFieldValue(defaultColorSet[i]);
            isFind = true;
            break;
          }
        }
      }
    }
    
    private color hex2color(String hex) {
      //hex.replace("#", "");
      String rs = hex.substring(1, 3);
      String gs = hex.substring(3, 5);
      String bs = hex.substring(5, 7);
      int r = Integer.parseInt(rs, 16);
      int g = Integer.parseInt(gs, 16);
      int b = Integer.parseInt(bs, 16);
      colorMode(RGB, 255, 255, 255);
      return color(r, g, b);
    }
    
    private String color2hex(color c) {
      colorMode(RGB, 255, 255, 255);
      int r = int(red(c));
      int g = int(green(c));
      int b = int(blue(c));
      //println(r + ", " + g + ", " + b);
      String rs = String.format("%2s", Integer.toHexString(r)).replace(" ", "0").toUpperCase();
      String gs = String.format("%2s", Integer.toHexString(g)).replace(" ", "0").toUpperCase();
      String bs = String.format("%2s", Integer.toHexString(b)).replace(" ", "0").toUpperCase();
      String hex = "#" + rs + gs + bs;
      //println(hex);
      return hex;
    }
   
    
    public int getVol() {
      return int(this.volTextFiled.getText());
    }
}
