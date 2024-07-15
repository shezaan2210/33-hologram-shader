uniform float uTime;

varying vec3 vPosition;

void main () {

    // position
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    // final position
    gl_Position = projectionMatrix * viewMatrix * modelPosition;

    vPosition = modelPosition.xyz;
}