-- Messages tablosuna updated_at alanı ekle
ALTER TABLE public.messages 
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW();

-- Mevcut kayıtlar için updated_at değerini created_at'e eşitle
UPDATE public.messages 
SET updated_at = created_at 
WHERE updated_at IS NULL;

-- updated_at alanı için trigger fonksiyonu oluştur
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- messages tablosu için trigger oluştur
DROP TRIGGER IF EXISTS update_messages_updated_at ON public.messages;
CREATE TRIGGER update_messages_updated_at
    BEFORE UPDATE ON public.messages
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();
