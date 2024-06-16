class disco {
  float xpos, ypos;
  float sizex, sizey;
  int value, mypile;
  color cor;

  public disco(float x, float y, float sizex, float sizey, int valor, color cor, int mypile) {
    this.xpos = x;
    this.ypos = y;
    this.sizex = sizex;
    this.sizey = sizey;
    this.value = valor;
    this.cor = cor;
    this.mypile = mypile;
  }

  public void Desenha(float x, float y, int pile) {
    xpos = x; 
    ypos = y;  
    
    if(mypile == pile || pile == 10)
      desenho();
  } //é a função draw desse objeto so mudei a lingua

  public void desenho() {
    pushMatrix();
    translate(xpos, ypos);

    stroke(10);
    fill(cor);
    
    rect( -sizex/2, 0, sizex, sizey);

    popMatrix();
  } //fim de desenho
  //essa função faz o desenho bonito dos discos
}
