create table if not exists public.products (
 id text primary key, name text not null, image text not null, description text,
 price numeric not null, original_price numeric, category text not null, brand text,
 affiliate_url text not null, date_added date not null default current_date,
 tags text[] default '{}', featured boolean default false, trending boolean default false,
 published boolean default true, label text default 'New', created_at timestamptz default now()
);
alter table public.products enable row level security;
grant select on public.products to anon, authenticated;
grant insert, update, delete on public.products to authenticated;
drop policy if exists "Public can view published products" on public.products;
create policy "Public can view published products" on public.products for select to anon, authenticated using (published = true);
drop policy if exists "Admin can manage products" on public.products;
create policy "Admin can manage products" on public.products for all to authenticated using (true) with check (true);
create table if not exists public.affiliate_clicks (
 id bigint generated always as identity primary key, product_id text, product_name text,
 category text, page_url text, created_at timestamptz default now()
);
alter table public.affiliate_clicks enable row level security;
grant insert on public.affiliate_clicks to anon, authenticated;
grant select on public.affiliate_clicks to authenticated;
drop policy if exists "Anyone can record affiliate clicks" on public.affiliate_clicks;
create policy "Anyone can record affiliate clicks" on public.affiliate_clicks for insert to anon, authenticated with check (true);
drop policy if exists "Admins can view affiliate clicks" on public.affiliate_clicks;
create policy "Admins can view affiliate clicks" on public.affiliate_clicks for select to authenticated using (true);
