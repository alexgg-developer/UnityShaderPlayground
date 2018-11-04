Shader "2D Shaders/LerpColor"
{
	Properties
	{
		
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100
		
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			struct appdata
			{
				float4 vertex : POSITION;
			};
			
			struct v2f
			{
				float4	vertex : SV_POSITION;
			};
			
			
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4	col1	=	fixed4(1,0,0,1);	//	Red
				float4	col2	=	float4(0,1,0,1);	//	Green
				
				//return lerp(col1,	col2,	(sin(_Time.y) + 1) * 0.5);
				return lerp(col1,	col2,	(_SinTime.w + 1) * 0.5);
			}
			ENDCG
		}
	}
}
