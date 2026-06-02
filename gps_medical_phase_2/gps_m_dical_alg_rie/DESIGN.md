---
name: GPS Médical Algérie
colors:
  surface: '#f6faf8'
  surface-dim: '#d7dbd8'
  surface-bright: '#f6faf8'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f0f4f2'
  surface-container: '#ebefec'
  surface-container-high: '#e5e9e7'
  surface-container-highest: '#dfe3e1'
  on-surface: '#181d1b'
  on-surface-variant: '#3e4946'
  inverse-surface: '#2d3130'
  inverse-on-surface: '#eef2ef'
  outline: '#6e7a76'
  outline-variant: '#bdc9c5'
  surface-tint: '#006b5e'
  primary: '#005e53'
  on-primary: '#ffffff'
  primary-container: '#00796b'
  on-primary-container: '#a1feec'
  inverse-primary: '#7ad7c6'
  secondary: '#526069'
  on-secondary: '#ffffff'
  secondary-container: '#d3e2ed'
  on-secondary-container: '#56656e'
  tertiary: '#843f29'
  on-tertiary: '#ffffff'
  tertiary-container: '#a2563f'
  on-tertiary-container: '#ffe8e2'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#97f3e2'
  primary-fixed-dim: '#7ad7c6'
  on-primary-fixed: '#00201b'
  on-primary-fixed-variant: '#005047'
  secondary-fixed: '#d6e5ef'
  secondary-fixed-dim: '#bac9d3'
  on-secondary-fixed: '#0f1d25'
  on-secondary-fixed-variant: '#3b4951'
  tertiary-fixed: '#ffdbd1'
  tertiary-fixed-dim: '#ffb59f'
  on-tertiary-fixed: '#3a0a00'
  on-tertiary-fixed-variant: '#75331f'
  background: '#f6faf8'
  on-background: '#181d1b'
  surface-variant: '#dfe3e1'
typography:
  h1:
    fontFamily: Manrope
    fontSize: 40px
    fontWeight: '700'
    lineHeight: '1.2'
    letterSpacing: -0.02em
  h2:
    fontFamily: Manrope
    fontSize: 32px
    fontWeight: '600'
    lineHeight: '1.3'
    letterSpacing: -0.01em
  h3:
    fontFamily: Manrope
    fontSize: 24px
    fontWeight: '600'
    lineHeight: '1.4'
    letterSpacing: 0em
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
    letterSpacing: 0em
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.5'
    letterSpacing: 0em
  label-caps:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: '1.0'
    letterSpacing: 0.05em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  unit: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  xxl: 48px
  container-max: 1280px
  gutter: 20px
---

## Brand & Style

The design system is rooted in the intersection of high-technology and compassionate care. It serves as a reliable navigator for the Algerian medical landscape, evoking a sense of calm authority and clinical precision. The visual style is **Modern Corporate Minimalism** with a focus on "Medical Clarity"—a philosophy that prioritizes ease of navigation, cognitive load reduction, and a premium, reassuring atmosphere. 

The aesthetic leverages generous whitespace to symbolize cleanliness and organization. Elements feel airy yet grounded, using a mix of subtle depth and glass-like surfaces to create a multi-dimensional workspace that feels advanced without being cold.

## Colors

The palette is designed for high legibility and a sense of "clinical premium." 

- **Deep Teal (#00796B)** serves as the primary anchor, used for key actions and brand presence to signify intelligence and stability.
- **Light Blue (#E3F2FD)** acts as the functional background for cards or section headers, providing a soft contrast to the pure white canvas.
- **Subtle Gradients** are applied sparingly to primary buttons and header surfaces to add a "glass-like" polish and modern depth.
- **Neutral Whites and Greys** maintain a high-contrast environment, ensuring all medical data is immediately parseable.

## Typography

This design system utilizes a dual-font approach to balance personality and utility. **Manrope** is used for headlines to provide a warm, modern, and human-centric touch with its balanced geometric curves. **Inter** is utilized for all body text and data-heavy interfaces to ensure maximum legibility at small sizes, particularly for medical results and labels. 

Hierarchies are strictly enforced through weight variations rather than just size, ensuring that mobile users can quickly scan information without visual fatigue.

## Layout & Spacing

A **12-column fluid grid** is used for desktop, transitioning to a **4-column grid** for mobile devices. The rhythm is based on a **4px baseline**, with 16px (md) being the standard padding for most interface elements. 

To emphasize the "premium" nature of the system, the layout utilizes "Breathable Gutters"—wide margins and ample vertical space between sections—to prevent the UI from feeling cluttered or stressful, which is critical in a medical context.

## Elevation & Depth

Visual hierarchy is established through **Ambient Shadows** and **Tonal Layering**. Instead of harsh borders, surfaces are defined by:
1.  **Level 0 (Base):** Pure white background.
2.  **Level 1 (Cards):** Soft, diffused shadows (Blur: 30px, Opacity: 4%, Color: #00796B) to create a subtle lift.
3.  **Level 2 (Modals/Active):** Slightly deeper shadows with a light blue tint to pull the element toward the user.

Glassmorphism is used for navigation bars and floating action buttons, employing a backdrop blur (12px) and a semi-transparent white fill (80%) to maintain context of the underlying content.

## Shapes

The shape language is defined by **large, friendly radii**. A standard 16px (rounded-lg) corner is applied to all primary cards and containers, while buttons use a fully rounded "pill" or 12px radius. This softness removes the "clinical coldness" often found in medical software, making the application feel approachable and safe. Smaller elements like tags or checkboxes use a 4px (soft) radius to maintain structural integrity.

## Components

- **Buttons:** Primary buttons use the teal-to-darker-teal gradient with white text. Hover states involve a slight scale increase (1.02x) rather than a color change to maintain the premium feel.
- **Cards:** White surfaces with 16px rounded corners and Level 1 elevation. For medical profiles, a 2px "Soft Blue" top-border can be used for categorization.
- **Input Fields:** Large tap targets (48px height minimum). Use a light grey background (#F7FAFC) that transitions to a white background with a teal 2px border on focus.
- **Chips/Tags:** Used for medical specialties or status. These use the Light Blue (#E3F2FD) background with Deep Teal text for high-contrast accessibility.
- **Progress Indicators:** Soft, rounded bars using the teal gradient.
- **Search Bar:** Centrally located with a prominent glassmorphic blur and a search icon in the deep teal primary color.