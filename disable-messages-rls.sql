-- RLS'yi kapat
ALTER TABLE public.messages DISABLE ROW LEVEL SECURITY;

-- Tüm politikaları sil
DROP POLICY IF EXISTS "Anyone can insert messages" ON public.messages;
DROP POLICY IF EXISTS "Only admins can view messages" ON public.messages;
DROP POLICY IF EXISTS "Only admins can update messages" ON public.messages;
DROP POLICY IF EXISTS "Only admins can delete messages" ON public.messages;
DROP POLICY IF EXISTS "Admins can view messages" ON public.messages;
DROP POLICY IF EXISTS "Anyone can create messages" ON public.messages;
DROP POLICY IF EXISTS "Admins can update messages" ON public.messages;
