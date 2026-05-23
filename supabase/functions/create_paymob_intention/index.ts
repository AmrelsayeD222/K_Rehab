import "jsr:@supabase/functions-js/edge-runtime.d.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const PAYMOB_SECRET_KEY = Deno.env.get("PAYMOB_SECRET_KEY");
    if (!PAYMOB_SECRET_KEY) {
      throw new Error("PAYMOB_SECRET_KEY is not set");
    }

    const requestBody = await req.json();

    const paymobUrl = "https://accept.paymob.com/v1/intention/";

    const response = await fetch(paymobUrl, {
      method: "POST",
      headers: {
        "Authorization": `Token ${PAYMOB_SECRET_KEY}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(requestBody),
    });

    const data = await response.json();

    return new Response(JSON.stringify(data), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
      status: response.status,
    });
  } catch (error: any) {
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
      status: 400,
    });
  }
});
