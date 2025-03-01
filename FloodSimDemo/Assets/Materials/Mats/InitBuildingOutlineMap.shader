﻿Shader "Custom/InitBuildingOutlineMap"
{
		Properties
		{
			_MainTex("Texture", 2D) = "white" {}
			//_BS2("Texture", 2D) = "white" {}
			//_BS3("Texture", 2D) = "white" {}
			//_BS4("Texture", 2D) = "white" {}
		}
			SubShader
			{
				// No culling or depth
				Cull Off ZWrite Off ZTest Always

				Pass
				{
					CGPROGRAM
					#pragma vertex vert
					#pragma fragment frag

					#include "UnityCG.cginc"

					struct appdata
					{
						float4 vertex : POSITION;
						float2 uv : TEXCOORD0;
					};

					struct v2f
					{
						float2 uv : TEXCOORD0;
						float4 vertex : SV_POSITION;
					};

					v2f vert(appdata v)
					{
						v2f o;
						o.vertex = UnityObjectToClipPos(v.vertex);
						o.uv = v.uv;
						return o;
					}
					sampler2D _MainTex;
					//sampler2D _BS1;
					//sampler2D _BS2;
					//sampler2D _BS3;
					//sampler2D _BS4;
					

					float4 frag(v2f i) : SV_Target
					{
						float4 t1 = tex2D(_MainTex, i.uv);
						return t1;
					}
					ENDCG
				}
			}


}
