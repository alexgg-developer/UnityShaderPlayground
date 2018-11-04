Shader "2D Shaders/BlendingModes"
{
	Properties
	{
		_MainTex	(	"Main	Texture",	2D	)	=	"white"	{}
	} 
	SubShader
	{
		//Blend Off
		//Blend One One //this refers to -> final_color	=	my_color	*	SrcFactor	+	screen_color	*	DstFactor
		//https://docs.unity3d.com/Manual/SL-Blend.html
		Blend	SrcColor	One

		BlendOp	Sub 

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
			
			v2f	vert ( appdata v )	{
				v2f	o;
				o.position	= UnityObjectToClipPos(v.position);
				o.uv	=	v.uv;
				return	o;
			}
			
			fixed4 frag (v2f i)	: SV_Target	
			{
				fixed4	col	=	tex2D(_MainTex,	i.uv);				
				return	col;
			}
			
			
			ENDCG
		}
	}
}

