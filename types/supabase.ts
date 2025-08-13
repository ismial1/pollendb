export interface Database {
  public: {
    Tables: {
      // Options tables
      taxonomy_options: {
        Row: {
          id: number
          category: string
          value: string
          label: string
          sort_order: number
          created_at: string
        }
        Insert: {
          id?: number
          category: string
          value: string
          label: string
          sort_order?: number
          created_at?: string
        }
        Update: {
          id?: number
          category?: string
          value?: string
          label?: string
          sort_order?: number
          created_at?: string
        }
      }
      pollen_options: {
        Row: {
          id: number
          category: string
          value: string
          label: string
          sort_order: number
          created_at: string
        }
        Insert: {
          id?: number
          category: string
          value: string
          label: string
          sort_order?: number
          created_at?: string
        }
        Update: {
          id?: number
          category?: string
          value?: string
          label?: string
          sort_order?: number
          created_at?: string
        }
      }
      shape_options: {
        Row: {
          id: number
          category: string
          value: string
          label: string
          sort_order: number
          created_at: string
        }
        Insert: {
          id?: number
          category: string
          value: string
          label: string
          sort_order?: number
          created_at?: string
        }
        Update: {
          id?: number
          category?: string
          value?: string
          label?: string
          sort_order?: number
          created_at?: string
        }
      }
      aperture_options: {
        Row: {
          id: number
          category: string
          value: string
          label: string
          sort_order: number
          created_at: string
        }
        Insert: {
          id?: number
          category: string
          value: string
          label: string
          sort_order?: number
          created_at?: string
        }
        Update: {
          id?: number
          category?: string
          value?: string
          label?: string
          sort_order?: number
          created_at?: string
        }
      }
      wall_options: {
        Row: {
          id: number
          category: string
          value: string
          label: string
          sort_order: number
          created_at: string
        }
        Insert: {
          id?: number
          category: string
          value: string
          label: string
          sort_order?: number
          created_at?: string
        }
        Update: {
          id?: number
          category?: string
          value?: string
          label?: string
          sort_order?: number
          created_at?: string
        }
      }
      surface_options: {
        Row: {
          id: number
          category: string
          value: string
          label: string
          sort_order: number
          created_at: string
        }
        Insert: {
          id?: number
          category: string
          value: string
          label: string
          sort_order?: number
          created_at?: string
        }
        Update: {
          id?: number
          category?: string
          value?: string
          label?: string
          sort_order?: number
          created_at?: string
        }
      }
      ornamentation_options: {
        Row: {
          id: number
          category: string
          value: string
          label: string
          sort_order: number
          created_at: string
        }
        Insert: {
          id?: number
          category: string
          value: string
          label: string
          sort_order?: number
          created_at?: string
        }
        Update: {
          id?: number
          category?: string
          value?: string
          label?: string
          sort_order?: number
          created_at?: string
        }
      }
      wall_structure_options: {
        Row: {
          id: number
          category: string
          value: string
          label: string
          sort_order: number
          created_at: string
        }
        Insert: {
          id?: number
          category: string
          value: string
          label: string
          sort_order?: number
          created_at?: string
        }
        Update: {
          id?: number
          category?: string
          value?: string
          label?: string
          sort_order?: number
          created_at?: string
        }
      }
      plants: {
        Row: {
          id: number
          name: string
          family: string
          description: string | null
          image_url: string | null
          images: string[] | null
          pollen_unit: string | null
          dispersal_unit: string | null
          pollen_class: string | null
          size: string | null
          hydrated_size: string | null
          polarity: string | null
          shape: string | null
          outline_polar: string | null
          pe_ratio: string | null
          orientation: string | null
          aperture_number: string | null
          aperture_type: string | null
          aperture_condition: string | null
          aperture_peculiarities: string | null
          ornamentation_lm: string | null
          nexine: string | null
          sexine: string | null
          ornamentation: string | null
          suprasculpture: string | null
          tectum: string | null
          infratectum: string | null
          foot_layer: string | null
          endexine: string | null
          intine: string | null
          supratectal_elements: string | null
          wall_peculiarities: string | null
          pollen_coatings: string | null
          reserves: string | null
          cell_number: string | null
          ubisch_bodies: string | null
          preparation: string | null
          staining: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: number
          name: string
          family: string
          description?: string | null
          image_url?: string | null
          images?: string[] | null
          pollen_unit?: string | null
          dispersal_unit?: string | null
          pollen_class?: string | null
          size?: string | null
          hydrated_size?: string | null
          polarity?: string | null
          shape?: string | null
          outline_polar?: string | null
          pe_ratio?: string | null
          orientation?: string | null
          aperture_number?: string | null
          aperture_type?: string | null
          aperture_condition?: string | null
          aperture_peculiarities?: string | null
          ornamentation_lm?: string | null
          nexine?: string | null
          sexine?: string | null
          ornamentation?: string | null
          suprasculpture?: string | null
          tectum?: string | null
          infratectum?: string | null
          foot_layer?: string | null
          endexine?: string | null
          intine?: string | null
          supratectal_elements?: string | null
          wall_peculiarities?: string | null
          pollen_coatings?: string | null
          reserves?: string | null
          cell_number?: string | null
          ubisch_bodies?: string | null
          preparation?: string | null
          staining?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: number
          name?: string
          family?: string
          description?: string | null
          image_url?: string | null
          images?: string[] | null
          pollen_unit?: string | null
          dispersal_unit?: string | null
          pollen_class?: string | null
          size?: string | null
          hydrated_size?: string | null
          polarity?: string | null
          shape?: string | null
          outline_polar?: string | null
          pe_ratio?: string | null
          orientation?: string | null
          aperture_number?: string | null
          aperture_type?: string | null
          aperture_condition?: string | null
          aperture_peculiarities?: string | null
          ornamentation_lm?: string | null
          nexine?: string | null
          sexine?: string | null
          ornamentation?: string | null
          suprasculpture?: string | null
          tectum?: string | null
          infratectum?: string | null
          foot_layer?: string | null
          endexine?: string | null
          intine?: string | null
          supratectal_elements?: string | null
          wall_peculiarities?: string | null
          pollen_coatings?: string | null
          reserves?: string | null
          cell_number?: string | null
          ubisch_bodies?: string | null
          preparation?: string | null
          staining?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      users: {
        Row: {
          id: string
          email: string
          full_name: string | null
          role: 'user' | 'moderator' | 'admin'
          avatar_url: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id: string
          email: string
          full_name?: string | null
          role?: 'user' | 'moderator' | 'admin'
          avatar_url?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          email?: string
          full_name?: string | null
          role?: 'user' | 'moderator' | 'admin'
          avatar_url?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      submissions: {
        Row: {
          id: number
          user_id: string
          plant_data: any
          status: string
          admin_notes: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: number
          user_id: string
          plant_data: any
          status?: string
          admin_notes?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: number
          user_id?: string
          plant_data?: any
          status?: string
          admin_notes?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      messages: {
        Row: {
          id: string
          name: string
          email: string
          subject: string
          message: string
          status: 'unread' | 'read' | 'replied'
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          email: string
          subject: string
          message: string
          status?: 'unread' | 'read' | 'replied'
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          email?: string
          subject?: string
          message?: string
          status?: 'unread' | 'read' | 'replied'
          created_at?: string
          updated_at?: string
        }
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
  }
}
