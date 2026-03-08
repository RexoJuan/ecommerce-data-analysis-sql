-- Creamos una Vista para no modificar la tabla original (Best Practice)
CREATE OR REPLACE VIEW v_productos_limpios AS
SELECT 
    product_id,
    product_category_name AS categoria_original,
    -- Traducción Dinámica
    CASE product_category_name
        WHEN 'perfumaria' THEN 'Perfumería / Perfumery'
        WHEN 'artes' THEN 'Artes / Arts'
        WHEN 'esporte_lazer' THEN 'Deporte y Ocio / Sports & Leisure'
        WHEN 'bebes' THEN 'Bebés / Baby'
        WHEN 'utilidades_domesticas' THEN 'Artículos del Hogar / Housewares'
        WHEN 'instrumentos_musicais' THEN 'Instrumentos Musicales / Musical Instruments'
        WHEN 'cool_stuff' THEN 'Cosas Geniales / Cool Stuff'
        WHEN 'moveis_decoracao' THEN 'Muebles y Decoración / Furniture & Decor'
        WHEN 'informatica_acessorios' THEN 'Informática / IT Accessories'
        WHEN 'beleza_saude' THEN 'Belleza y Salud / Health & Beauty'
        ELSE INITCAP(REPLACE(product_category_name, '_', ' ')) -- Limpieza genérica
    END AS categoria_multilenguaje,
    product_weight_g / 1000 AS peso_kg -- Convertimos de gramos a kilos
FROM ecommerce_olist.productos;