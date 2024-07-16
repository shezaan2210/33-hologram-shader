uniform float uTime;
uniform vec3 uColor;

varying vec3 vPosition;
varying vec3 vNormal;

void main () {

    // normal
    vec3 normal = normalize(vNormal);
    if(!gl_FrontFacing)
    normal *= - 1.0;

    // stripes
    float stripes = mod((vPosition.y -  uTime * .02) * 25.0, 1.0);
    stripes = pow(stripes, 3.0);

    // Fresnel
    vec3 viewDirection = normalize(vPosition - cameraPosition);
    float fresnel = dot(viewDirection, normal) + 1.0;
    fresnel = pow(fresnel, 2.0);

    float fallOff = smoothstep(0.8, 0.0, fresnel);

    // holographic
    float holographic = stripes * fresnel;
    holographic += fresnel * 1.25;
    holographic *= fallOff;

    gl_FragColor = vec4(uColor, holographic);
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
}