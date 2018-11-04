Shader "2D Shaders/EndlessScrollerBackground"
{
    Properties
    {
        _MainTex ( "Main Texture", 2D ) = "white" {}
		Speed ( "Speed", float) = 0.5
    }

    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            struct appdata
            {
                float4 position : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 position : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            sampler2D _MainTex;
			float Speed;

            v2f vert (appdata v)
            {
                v2f o;
                o.position = UnityObjectToClipPos(v.position);
                o.uv = v.uv;
                return o;
            }
            
            fixed4 frag (v2f i) : SV_Target
            {
				float2 displacedUV = i.uv;
				displacedUV.x = displacedUV.x + _Time.y * Speed;
                fixed4 col = tex2D(_MainTex, displacedUV);
                return col;
            }

            ENDCG
        }
    }
}