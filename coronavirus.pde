class CoronaVirus{
    PVector pos;
    int num_pts = floor(random(50,200));
    float radius = random(50, 100);
    float finger_length = random(5, 20);
    
    float phi = (sqrt(5)+1)/2 - 1; // golden ratio
    float ga = phi*2*PI;           // golden angle

    PVector finger_pts[] = new PVector[num_pts];

    CoronaVirus(){
        pos = new PVector(random(-width, width), random(-width, width), random(-width, width));
        calcFingers();
    }

    void calcFingers(){
        //quick estimation of evenly distributed points on a sphere
        //reference: https://www.openprocessing.org/sketch/41142
        for(int i=0;i<num_pts;i++)
        {
            float lon = ga*(i);
            lon /= 2*PI; lon -= floor(lon); lon *= 2*PI;
            if (lon > PI)  lon -= 2*PI;
        
            // Convert dome height (which is proportional to surface area) to latitude
            float lat = asin(-1 + 2*(i)/(float)num_pts);
            finger_pts[i] = new PVector(lat, lon);
        }
    }

    void draw(){
        pushMatrix();
        translate(pos.x, pos.y, pos.z);
        noFill();
        stroke(255,70);
        sphereDetail(10);
        sphere(radius);

        //draw fingers
        for(int i=0;i<num_pts;i++)
        {
            pushMatrix();
            rotateY(finger_pts[i].x);
            rotateZ(-finger_pts[i].y);
            translate(0,radius + finger_length,0);
            stroke(255,0,0,120);
            box(3,3,3);
            line(0,-finger_length,0,0);
            popMatrix();
        }
        popMatrix();
    }
}