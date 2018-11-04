Shader "2D Shaders/SolidColor"
{
	Properties
	{
		//	...
	} 
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma	vertex	vert
			#pragma	fragment	frag
			
			struct	appdata {
				float4	position : POSITION;
			};
			
			struct v2f {
				float4	position : SV_POSITION;
			};
			
			v2f	vert ( appdata v )	{
				v2f	o;
				o.position	= UnityObjectToClipPos(v.position);
				return	o;
			}
			
			fixed4 frag (v2f i)	: SV_Target	{
				return	fixed4(1,0,0,1);
			}
			
			
			ENDCG
		}
	}
}

