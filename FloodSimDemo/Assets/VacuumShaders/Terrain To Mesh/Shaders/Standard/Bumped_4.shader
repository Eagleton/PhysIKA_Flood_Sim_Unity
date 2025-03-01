﻿Shader "VacuumShaders/Terrain To Mesh/Standard/Bumped/4 Textures" 
{
	Properties 
	{
		_Color("Tint Color", color) = (1, 1, 1, 1)
		_V_T2M_Control("Control Map (RGBA)", 2D) = "black" {}

		//TTM				
		[V_T2M_Layer] _V_T2M_Splat1("Layer 1 (R)", 2D) = "white" {}
		[HideInInspector] _V_T2M_Splat1_uvScale("", float) = 1
		[HideInInspector] _V_T2M_Splat1_bumpMap("", 2D) = ""{}
		[HideInInspector] _V_T2M_Splat1_Glossiness("Smoothness", Range(0,1)) = 0.5
		[HideInInspector] _V_T2M_Splat1_Metallic("Metallic", Range(0,1)) = 0.0

		[V_T2M_Layer] _V_T2M_Splat2("Layer 2 (G)", 2D) = "white" {}
		[HideInInspector] _V_T2M_Splat2_uvScale("", float) = 1
		[HideInInspector] _V_T2M_Splat2_bumpMap("", 2D) = ""{}
		[HideInInspector] _V_T2M_Splat2_Glossiness("Smoothness", Range(0,1)) = 0.5
		[HideInInspector] _V_T2M_Splat2_Metallic("Metallic", Range(0,1)) = 0.0

		[V_T2M_Layer] _V_T2M_Splat3("Layer 3 (B)", 2D) = "white" {}
		[HideInInspector] _V_T2M_Splat3_uvScale("", float) = 1
		[HideInInspector] _V_T2M_Splat3_bumpMap("", 2D) = ""{}
		[HideInInspector] _V_T2M_Splat3_Glossiness("Smoothness", Range(0,1)) = 0.5
		[HideInInspector] _V_T2M_Splat3_Metallic("Metallic", Range(0,1)) = 0.0

		[V_T2M_Layer] _V_T2M_Splat4 ("Layer 4 (A)", 2D) = "white" {}
		[HideInInspector] _V_T2M_Splat4_uvScale("", float) = 1	
		[HideInInspector] _V_T2M_Splat4_bumpMap("", 2D) = ""{}
		[HideInInspector] _V_T2M_Splat4_Glossiness("Smoothness", Range(0,1)) = 0.5
		[HideInInspector] _V_T2M_Splat4_Metallic("Metallic", Range(0,1)) = 0.0



		//Fallback use only
		[NoScaleOffset]_MainTex("BaseMap (Fallback use only!)", 2D) = "white" {}
	}

	SubShader 
	{  
		Tags { "RenderType"="Opaque" }
		LOD 200   
		  
		CGPROGRAM  
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows vertex:vert
			 
		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0 
		#pragma exclude_renderers gles 

		#define V_T2M_STANDARD
		#define V_T2M_BUMP  
		#define V_T2M_3_TEX
		#define V_T2M_4_TEX
		 
		#include "../cginc/T2M_Deferred.cginc"		

		ENDCG
	}  


	SubShader 
	{
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert vertex:vert
		#pragma target 2.0

		#define V_T2M_3_TEX
		#define V_T2M_4_TEX

		#include "../cginc/T2M_Deferred.cginc"		

		ENDCG
	} 

	FallBack "Hidden/VacuumShaders/Fallback/VertexLit"
}
