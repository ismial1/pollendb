# 🚀 Supabase Entegrasyon Rehberi

## 📋 Adım Adım Kurulum

### 1. **Supabase Projesi Oluşturma**
1. [Supabase Dashboard](https://supabase.com/dashboard)'a gidin
2. "New Project" butonuna tıklayın
3. Proje adını girin (örn: `palves-database`)
4. Database şifresi belirleyin
5. Region seçin (EU West 1 önerilir)
6. "Create new project" butonuna tıklayın

### 2. **Environment Variables Ayarlama**
1. Supabase projenizin Settings > API bölümüne gidin
2. `Project URL` ve `anon public` key'i kopyalayın
3. Proje root dizininde `.env` dosyası oluşturun:

```env
NUXT_PUBLIC_SUPABASE_URL=your_project_url_here
NUXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key_here
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key_here
```

### 3. **Veritabanı Şeması Oluşturma**
1. Supabase Dashboard > SQL Editor'e gidin
2. `supabase-schema.sql` dosyasının içeriğini kopyalayın
3. SQL Editor'de çalıştırın

### 4. **Supabase Paketini Yükleme**
```bash
yarn add @supabase/supabase-js
```

### 5. **Storage Bucket Oluşturma (İsteğe Bağlı)**
1. Storage > New Bucket
2. Bucket adı: `plant-images`
3. Public bucket olarak işaretleyin
4. RLS policies ekleyin:

```sql
-- Allow public read access to plant images
CREATE POLICY "Plant images are publicly accessible" ON storage.objects
FOR SELECT USING (bucket_id = 'plant-images');

-- Allow authenticated users to upload images
CREATE POLICY "Users can upload plant images" ON storage.objects
FOR INSERT WITH CHECK (bucket_id = 'plant-images' AND auth.role() = 'authenticated');
```

## 🔧 Kullanım Örnekleri

### Authentication
```typescript
const supabaseStore = useSupabaseStore()

// Kayıt ol
await supabaseStore.signUp('user@example.com', 'password123', 'John Doe')

// Giriş yap
await supabaseStore.signIn('user@example.com', 'password123')

// Çıkış yap
await supabaseStore.signOut()
```

### Plants CRUD
```typescript
// Tüm bitkileri getir
await supabaseStore.fetchPlants()

// Yeni bitki ekle
await supabaseStore.createPlant({
  name: 'Rosa canina',
  family: 'Rosaceae',
  description: 'Kuşburnu çalısı',
  pollen_unit: 'monad',
  // ... diğer alanlar
})

// Bitki güncelle
await supabaseStore.updatePlant(1, {
  description: 'Güncellenmiş açıklama'
})
```

### Submissions
```typescript
// Yeni submission oluştur
await supabaseStore.createSubmission({
  plant_data: {
    name: 'Yeni Bitki',
    family: 'Asteraceae',
    // ... diğer veriler
  },
  status: 'pending'
})
```

## 🔒 Güvenlik

### Row Level Security (RLS)
- **Plants**: Herkes okuyabilir, sadece admin yazabilir
- **Users**: Kullanıcılar sadece kendi profillerini görebilir
- **Submissions**: Kullanıcılar kendi submission'larını görebilir
- **Messages**: Sadece admin mesajları görebilir

### Admin Kullanıcı Oluşturma
1. Normal kullanıcı hesabı oluşturun
2. Supabase Dashboard > Table Editor > users
3. Kullanıcının `role` alanını `admin` olarak güncelleyin

## 📊 Veritabanı Yapısı

### Tables
- **plants**: Bitki ve polen verileri
- **users**: Kullanıcı profilleri (auth.users ile bağlantılı)
- **submissions**: Kullanıcı gönderileri
- **messages**: İletişim formu mesajları

### Relationships
- `users.id` → `submissions.user_id`
- `users.id` → `auth.users.id` (Supabase Auth)

## 🚨 Hata Ayıklama

### Yaygın Hatalar
1. **"Missing Supabase environment variables"**
   - `.env` dosyasını kontrol edin
   - Environment variables'ları doğru şekilde ayarlayın

2. **"RLS policy violation"**
   - Kullanıcının doğru role sahip olduğunu kontrol edin
   - RLS policies'leri kontrol edin

3. **"Invalid JWT"**
   - Session'ın geçerli olduğunu kontrol edin
   - Kullanıcının tekrar giriş yapmasını sağlayın

## 🔄 Migration

### Mevcut Verileri Taşıma
1. `types/plants.ts` dosyasındaki verileri Supabase'e aktarın
2. SQL Editor'de INSERT komutlarını çalıştırın
3. Resimleri Storage bucket'a yükleyin

### API Değişiklikleri
- `useAxios` yerine `useSupabase` kullanın
- `usePolenStore` yerine `useSupabaseStore` kullanın
- Environment variables'ları güncelleyin

## 📱 Test Etme

### Local Development
```bash
# Development server'ı başlat
yarn dev

# Environment variables'ları kontrol et
echo $NUXT_PUBLIC_SUPABASE_URL
```

### Production
1. Environment variables'ları production'a deploy edin
2. Supabase projesinin production'da çalıştığından emin olun
3. RLS policies'leri kontrol edin

## 🎯 Sonraki Adımlar

1. **Authentication UI'ını güncelleyin**
2. **Form validation ekleyin**
3. **Error handling geliştirin**
4. **Loading states ekleyin**
5. **Real-time updates ekleyin**
6. **File upload functionality ekleyin**
