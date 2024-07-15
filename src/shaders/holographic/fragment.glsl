uniform float uTime;

varying vec3 vPosition;

void main () {

    // stripes
    float stripes = mod((vPosition.x -  uTime * .02) * 25.0, 1.0);
    stripes = pow(stripes, 3.0);

    gl_FragColor = vec4(vec3(1.0), stripes);
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
}