uniform vec2 iResolution;
uniform float iGlobalTime;
uniform float realTime;

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

const vec4 lumcoeff = vec4(0.299, 0.587, 0.114, 0);

void main() {
  vec2 uv = gl_FragCoord.xy / iResolution.xy;
  vec4 col = texture2D(texture, vertTexCoord.st);
  vec4 asd = col;
  float lum = dot(col, lumcoeff);
  float junk = 0.0000000000000000000001 * (realTime + iGlobalTime + iResolution.x);

  col.rgb /= col.a;
  if (realTime > 60000.0) {
    col.rgb = ((col.rgb - 0.5f) * max(3.0, 0)) + 0.5f;
  }

  col.r = col.r + 0.2 * col.r * sin(2.145*uv.x + uv.y)*sin(iGlobalTime*0.1 + uv.x * cos(4.0*uv.y));// * (0.5 + 0.5 * cos(uv.x * iGlobalTime));
  col.b = 0.5 + col.b * 0.2*cos(iGlobalTime*0.1 + uv.y * sin(8.0*uv.y + 42.21));// + 0.5 * sin(0.1*gl_FragDepth);

  if (realTime > 40000.0 && realTime < 60000.0) {
    col.r = asd.r * sin(lum * cos(lum*2.324673 + 0.1234 + iGlobalTime));
    col.g = asd.b * cos(lum * lum * iGlobalTime);
    col.b = asd.g * sin(lum * iGlobalTime);// * (0.5 + 0.5 * sin(uv.y * iGlobalTime));
    if (lum < 0.01) {
      col.r = 0.1 + 0.1*sin(3.0*uv.x*cos(42.175634*iGlobalTime) + 5.0*uv.y*iGlobalTime);
      col.g = 0.1 + 0.1*sin(3.0*uv.x*cos(42.175634*iGlobalTime) + 5.0*uv.y*iGlobalTime);

      col.b = 0.1 + 0.1*sin(3.0*uv.x*cos(42.175634*iGlobalTime) + 5.0*uv.y*iGlobalTime);
    }
    //col.r = col.r + 0.4 * col.r * cos()
  }
  if (realTime > 60000.0) {
    col.b = lum;
  }
  if (realTime > 70000.0) {
    col.r = lum * sin(641.56*uv.x + 24.215*uv.y*uv.x);
    col.g = lum + 0.3 * col.r * cos(0.31*uv.x + 42.1*uv.y);
    col.b = asd.b * sin(uv.x+20.42)*sin(1.53*uv.x + 5.21*uv.y*uv.y);
  }
  if (realTime > 80000.0) {
    col.r = asd.r;
    col.g = asd.g * sin(lum * lum);
    col.b = asd.b * sin(uv.x + iGlobalTime*0.1);
  }
  if (realTime > 90000.0) {
    col.g = asd.r * cos(uv.y + uv.x*uv.y + iGlobalTime);
    col.b = asd.g * sin(lum * lum);
    col.r = asd.b * sin(uv.x + iGlobalTime*0.1);
  }
  if (realTime > 100000.0) {
    col.g = asd.r * cos(uv.y + uv.x*uv.y + iGlobalTime);
    col.r = asd.g * sin(lum * lum);
    col.b = asd.b * lum * sin(uv.x + iGlobalTime*0.1);
  }
  if (realTime > 110000.0) {
    col.r = asd.r * sin(lum * cos(lum*2.324673 + 0.1234 + iGlobalTime));
    col.g = asd.b * cos(lum * lum * iGlobalTime);
    col.b = asd.g * sin(lum * iGlobalTime);// * (0.5 + 0.5 * sin(uv.y * iGlobalTime));

  }



  col.rgb *= col.a;


  if (0.01 < lum) {
    gl_FragColor = col;
    //gl_FragColor = vec4(sin(iGlobalTime) * col.r, col.g, col.b, col.a);
  } else {

    /*if (mod(uv.x, 0.1) < (0.05 + 0.05*sin(uv.y + iGlobalTime))) {
      r += 0.1;
    }*/
    //r = 255 * (uv.x % 0.1 < 0.05);

    gl_FragColor = col;
  }
}

/*
varying vec4 vertColor;
varying vec3 ecNormal;
varying vec3 lightDir;


void main() {
  vec2 uv = gl_FragCoord.xy / iResolution.xy;


  vec3 direction = normalize(lightDir);
  vec3 normal = normalize(ecNormal);
  float intensity = max(0.0, dot(direction, normal));

  gl_FragColor = vec4(intensity*sin(iGlobalTime), intensity*sin(uv.x), intensity, 1) * vertColor;
  //vec4 color = texture2D(backbuffer, position);
	//gl_FragColor = gl_Color;// + vec4(uv,0.5+0.5*sin(iGlobalTime),1.0);
}

*/
