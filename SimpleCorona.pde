int NUM_VIRUS = 50;
ArrayList<CoronaVirus> viruses;

void setup(){
    size(1000, 1000, P3D);
    background(0, 0, 0, 255);
    
    viruses = new ArrayList();
    for(int i=0;i<NUM_VIRUS;i++){
        viruses.add(new CoronaVirus());
    }
}

void draw(){
    background(0);

    //uncomment for center rotating anchor point
    // translate(width/2, height/2);
    
    rotateX(frameCount*0.007);
    rotateY(frameCount*0.005);
    for(int i=0;i<viruses.size();i++){
        CoronaVirus virus = viruses.get(i);
        virus.draw();
    }
}

void keyPressed(){
    viruses.add(new CoronaVirus());
}