-- Önce tüm mevcut politikaları silelim
DROP POLICY IF EXISTS "Anyone can insert messages" ON public.messages;
DROP POLICY IF EXISTS "Only admins can view messages" ON public.messages;
DROP POLICY IF EXISTS "Admins can view messages" ON public.messages;
DROP POLICY IF EXISTS "Anyone can create messages" ON public.messages;
DROP POLICY IF EXISTS "Admins can update messages" ON public.messages;
DROP POLICY IF EXISTS "Only admins can update messages" ON public.messages;
DROP POLICY IF EXISTS "Only admins can delete messages" ON public.messages;

-- Temiz politikalar oluşturalım
-- Herkes mesaj gönderebilir (INSERT)
CREATE POLICY "Anyone can insert messages" ON public.messages
    FOR INSERT WITH CHECK (true);

-- Sadece adminler mesajları görebilir (SELECT)
CREATE POLICY "Only admins can view messages" ON public.messages
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM users 
            WHERE users.id = auth.uid() 
            AND users.role = 'admin'
        )
    );

-- Sadece adminler mesajları güncelleyebilir (UPDATE)
CREATE POLICY "Only admins can update messages" ON public.messages
    FOR UPDATE USING (
        EXISTS (
            SELECT 1 FROM users 
            WHERE users.id = auth.uid() 
            AND users.role = 'admin'
        )
    );

-- Sadece adminler mesajları silebilir (DELETE)
CREATE POLICY "Only admins can delete messages" ON public.messages
    FOR DELETE USING (
        EXISTS (
            SELECT 1 FROM users 
            WHERE users.id = auth.uid() 
            AND users.role = 'admin'
        )
    );
