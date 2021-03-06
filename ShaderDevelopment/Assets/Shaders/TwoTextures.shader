﻿Shader "2D Shaders/TwoTextures"
{
	Properties
	{
		_MainTex	(	"Main	Texture",	2D	)	=	"white"	{}
		_SecondTexture	(	"Second Texture",	2D	)	=	"white"	{}
	} 
	SubShader
	{
		Blend SrcAlpha OneMinusSrcAlpha
		
		Pass
		{
			CGPROGRAM
			#pragma	vertex	vert
			#pragma	fragment	frag
			
			struct	appdata {
				float4	position : POSITION;
				float2	uv	:	TEXCOORD0;
			};
			
			struct v2f {
				float4	position : SV_POSITION;
				float2	uv	:	TEXCOORD0;
			};
			
			sampler2D	_MainTex;
			sampler2D	_SecondTexture;
			
			v2f	vert ( appdata v )	{
				v2f	o;
				o.position	= UnityObjectToClipPos(v.position);
				o.uv	=	v.uv;
				return	o;
			}
			
			fixed4 frag (v2f i)	: SV_Target	
			{
				fixed4	col1	=	tex2D(_MainTex,	i.uv);				
				fixed4	col2	=	tex2D(_SecondTexture,	i.uv);
				//return	col1+col2;
				//return	col1*col2;
				return	1	-	(1	-	col1)	*	(1	-	col2);
			}
			
			
			ENDCG
		}
	}
}

