-- Estructura inicial para IA PulsePredict - Soledad
-- Colaboración técnica: Dr. Germán Losada & IIT Indore

CREATE TABLE pacientes (
    id SERIAL PRIMARY KEY,
    nombre_anonimizado VARCHAR(100), -- Privacidad de datos médicos
    barrio_soledad VARCHAR(100),     -- Mapeo epidemiológico local
    riesgo_cardiaco_previo BOOLEAN DEFAULT FALSE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE triaje_ia_predictivo (
    id SERIAL PRIMARY KEY,
    paciente_id INT REFERENCES pacientes(id),
    fuente_dato VARCHAR(10),        -- 'SMS' o 'IVR' para inclusión digital
    analisis_sentimiento_nlp FLOAT, -- Procesado por Azure OpenAI
    alerta_urgencia VARCHAR(20),    -- 'Baja', 'Media', 'Alta'
    procesado_en_nube BOOLEAN DEFAULT TRUE
);

CREATE TABLE visitas_campo_resilientes (
    id SERIAL PRIMARY KEY,
    triaje_id INT REFERENCES triaje_ia_predictivo(id),
    sincronizado_offline BOOLEAN,   -- Soporte para zonas sin señal
    observaciones_medicas TEXT,
    fecha_visita TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);