﻿    // Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'

Shader "Custom/70-79/75_01_WSN_2"
{
    SubShader
    {
        Pass 
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"
            
            struct vertexInput
            {
                float4 vertex : POSITION;
                float4 normal : NORMAL;
            };
            
            struct vertexOuput
            {
                float4 pos : SV_POSITION;
                float4 normalWorld : TEXCOORD0;
            };
            
            vertexOuput vert(vertexInput v)
            {
                vertexOuput o;
                UNITY_INITIALIZE_OUTPUT(vertexOuput, o);
                
                o.pos = UnityObjectToClipPos(v.vertex);
                o.normalWorld = float4(normalize(mul(normalize(v.normal.xyz), (float3x3) unity_WorldToObject)), v.normal.w); // v.normal.xyz -> float1x3
                
                return o;
            }
            
            float4 frag(vertexOuput i) : COLOR
            {
                return i.normalWorld;
            }
            ENDCG
        }
    }
}   