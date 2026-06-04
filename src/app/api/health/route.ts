import { createClient } from "@/lib/supabase/server";
import { NextResponse } from "next/server";

/**
 * Health check — verifies Supabase connection + public RLS read.
 * GET /api/health
 */
export async function GET() {
  try {
    const supabase = await createClient();
    const { data, error } = await supabase
      .from("categories")
      .select("name, emoji, slug")
      .order("sort_order");

    if (error) {
      return NextResponse.json(
        { ok: false, stage: "query", error: error.message },
        { status: 500 },
      );
    }

    return NextResponse.json({
      ok: true,
      supabase: "connected",
      categoryCount: data.length,
      categories: data,
    });
  } catch (e) {
    return NextResponse.json(
      { ok: false, stage: "connect", error: String(e) },
      { status: 500 },
    );
  }
}
