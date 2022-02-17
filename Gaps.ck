SndBuf buffer => Pan2 pan => dac;
SndBuf buffer2 => Pan2 pan2 => dac;
Noise andy => dac;
.0005 => andy.gain;
me.dir() + "voice.wav" => buffer.read;
me.dir() + "voice.wav" => buffer2.read;

buffer.samples() => int s;

6::second => dur tick;

0 => int i;
andy.gain() => float andygain;


while (i < 80) {
    
    if (i%2 == 0) {
        
        i + 1 => i;
        0 => buffer.pos;
        0 => buffer2.pos;
        .5 => buffer2.gain;
        .5 => buffer.gain;
        -1* pan.pan() +.05 =>  pan.pan;
         -1 * pan2.pan() -.05  =>  pan.pan;
        .008 + andygain => andy.gain;
        tick => now;
    }
    
    else {
        i + 1 => i;
        0 => buffer.pos;
        0 => buffer.gain;
        0 => buffer2.gain;
        andy.gain() => andygain;
        0 => andy.gain;
        buffer.rate() * 1.22 => buffer.rate;
        buffer2.rate() * 1.21 => buffer2.rate;
        tick/1.22 => tick;
        tick/3 => now;
}
}

0 => buffer2.gain;
fun void speak(int ticktime, float rate, int loops){
    0 => i;
    ticktime::ms => tick;
    while (i <  loops) {
        rate => buffer.rate;
        if (i%2 == 0) {
            i + 1 => i;
            0 => buffer.pos;
            0 => buffer2.pos;
            Math.random2f(.8,1) => buffer.gain;
            Math.random2f(-.3,.3) => pan.pan;
            Math.random2(0,s-1) => buffer.pos;
            .8 => buffer2.gain;
            .32 => andy.gain;
            tick => now;
        }
        
        else {
            i + 1 => i;
            0 => buffer.pos;
            0 => buffer.gain;
            0 => buffer2.gain;
            0 => andy.gain;
            tick => now;
        }
    }
    
}

int ticktime;
float rate;
int loops;

speak(50,1,200);

for (0 => int i; i < 5; i++){
    Math.random2(40, 60) => ticktime;
    Math.random2f(.8,1.2) => rate;
    Math.random2(50,100) => loops;
    speak(ticktime,rate,loops);
    
}
.1 => andy.gain;
0 => buffer.gain;
3::second => now;
.33 => andy.gain;
for (0 => int i; i < 5; i++){
    Math.random2(30, 70) => ticktime;
    Math.random2f(.5,1.4) => rate;
    Math.random2(20,50) => loops;
    speak(ticktime,rate,loops);
    
}

.005 => andy.gain;
0 => buffer.gain;
0 => buffer2.gain;
3::second => now;
.33 => andy.gain;

for (0 => int i; i < 40; i++){
    Math.random2(10, 100) => ticktime;
    Math.random2f(.2,1.7) => rate;
    Math.random2(5,10) => loops;
    speak(ticktime,rate,loops);
    
}
0 => buffer.gain;
0 => buffer2.gain;
.005 =>andy.gain;
1::second => now;
.004 =>andy.gain;
1::second => now;
.003 =>andy.gain;
1::second => now;
.002 =>andy.gain;
1::second => now;
.001 =>andy.gain;
1::second => now;