class palito {
  float xpos, ypos;
  int maxpedra, numpedra;
  int[] pedras;
  int pau;

  float xforma, yforma;

  public palito(float x, float y, int nP, int pau) {
    this.xpos = x;
    this.ypos = y;
    this.maxpedra = nP;
    this.pedras = new int[nP];
    this.xforma = 600; //height - xforma - 50 = y
    this.yforma = 40;
    this.pau = pau;  
}

  public void Desenha() {
      desenho();
  }

  public void desenho() {
    pushMatrix();
    translate(xpos, ypos);

    stroke(10);
    fill(130, 55, 185);

    rect(0, 0, yforma, xforma);
    
    noStroke();
    rect(0, xforma, yforma, yforma);

    popMatrix();
  } //fim de desenho
  //essa função faz o desenho bonito dos palitos 520
  
  public float[] vemdisco(int sup) {
    float[] doc = new float[2];
    doc[0] = (numpedra - sup)*30+(25 - numpedra) * 30;
    doc[1] = 320 + pau*520 + (pau+1)*20;
    return doc;
  }

}
