// Artwork AI Verifier - Frontend JavaScript
const API_URL = 'http://localhost:5000';

let masterFile = null;
let supplierFile = null;
let currentComparisonId = null;

// Initialize app
document.addEventListener('DOMContentLoaded', function() {
    setupFileInputs();
    setupDragAndDrop();
    setupCompareButton();
});

// Setup file inputs
function setupFileInputs() {
    const masterInput = document.getElementById('masterFile');
    const supplierInput = document.getElementById('supplierFile');

    masterInput.addEventListener('change', (e) => handleFileSelect(e, 'master'));
    supplierInput.addEventListener('change', (e) => handleFileSelect(e, 'supplier'));
}

// Setup drag and drop
function setupDragAndDrop() {
    const masterZone = document.getElementById('masterDropZone');
    const supplierZone = document.getElementById('supplierDropZone');

    setupDropZone(masterZone, 'master');
    setupDropZone(supplierZone, 'supplier');
}

function setupDropZone(zone, type) {
    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
        zone.addEventListener(eventName, preventDefaults, false);
    });

    function preventDefaults(e) {
        e.preventDefault();
        e.stopPropagation();
    }

    ['dragenter', 'dragover'].forEach(eventName => {
        zone.addEventListener(eventName, () => zone.classList.add('dragover'), false);
    });

    ['dragleave', 'drop'].forEach(eventName => {
        zone.addEventListener(eventName, () => zone.classList.remove('dragover'), false);
    });

    zone.addEventListener('drop', (e) => handleDrop(e, type), false);
}

function handleDrop(e, type) {
    const files = e.dataTransfer.files;
    if (files.length > 0) {
        const file = files[0];
        if (validateFile(file)) {
            setFile(file, type);
        }
    }
}

function handleFileSelect(e, type) {
    const file = e.target.files[0];
    if (file && validateFile(file)) {
        setFile(file, type);
    }
}

function validateFile(file) {
    const allowedTypes = ['application/pdf', 'image/png', 'image/jpeg', 'image/jpg'];
    const maxSize = 50 * 1024 * 1024; // 50MB

    if (!allowedTypes.includes(file.type)) {
        alert('Tipo de archivo no permitido. Use PDF, PNG o JPG.');
        return false;
    }

    if (file.size > maxSize) {
        alert('Archivo demasiado grande. Máximo 50MB.');
        return false;
    }

    return true;
}

function setFile(file, type) {
    if (type === 'master') {
        masterFile = file;
        updateFileInfo('masterFileInfo', file);
    } else {
        supplierFile = file;
        updateFileInfo('supplierFileInfo', file);
    }

    checkReadyToCompare();
}

function updateFileInfo(elementId, file) {
    const info = document.getElementById(elementId);
    const size = (file.size / 1024 / 1024).toFixed(2);
    info.innerHTML = `
        ✅ <strong>${file.name}</strong><br>
        📦 Tamaño: ${size} MB<br>
        📄 Tipo: ${file.type}
    `;
    info.classList.add('show');
}

function checkReadyToCompare() {
    const compareBtn = document.getElementById('compareBtn');
    compareBtn.disabled = !(masterFile && supplierFile);
}

// Setup compare button
function setupCompareButton() {
    document.getElementById('compareBtn').addEventListener('click', compareArtworks);
}

async function compareArtworks() {
    if (!masterFile || !supplierFile) return;

    // Show loading
    showLoading();

    try {
        const formData = new FormData();
        formData.append('master', masterFile);
        formData.append('supplier', supplierFile);

        updateLoadingMessage('Subiendo archivos...');

        const response = await fetch(`${API_URL}/api/compare`, {
            method: 'POST',
            body: formData
        });

        if (!response.ok) {
            throw new Error('Error en la comparación');
        }

        const data = await response.json();

        if (data.success) {
            currentComparisonId = data.comparison_id;
            displayResults(data.results);
        } else {
            throw new Error(data.error || 'Error desconocido');
        }

    } catch (error) {
        hideLoading();
        alert('Error: ' + error.message);
        console.error(error);
    }
}

function showLoading() {
    document.querySelector('.upload-section').style.display = 'none';
    document.getElementById('loadingSection').style.display = 'block';
    document.getElementById('resultsSection').style.display = 'none';
}

function hideLoading() {
    document.getElementById('loadingSection').style.display = 'none';
}

function updateLoadingMessage(message) {
    document.getElementById('loadingMessage').textContent = message;
}

function displayResults(results) {
    hideLoading();

    // Show results section
    document.getElementById('resultsSection').style.display = 'block';

    // Scroll to results
    document.getElementById('resultsSection').scrollIntoView({ behavior: 'smooth' });

    // Display overall status
    displayOverallStatus(results);

    // Display summary stats
    displaySummaryStats(results);

    // Display visual comparison
    displayVisualComparison(results);

    // Display text comparison
    displayTextComparison(results);
}

function displayOverallStatus(results) {
    const statusCard = document.getElementById('overallStatus');
    const status = results.overall_status;

    let statusClass = '';
    let icon = '';

    if (status === 'APPROVED') {
        statusClass = 'approved';
        icon = '✅';
    } else if (status === 'REJECTED') {
        statusClass = 'rejected';
        icon = '❌';
    } else {
        statusClass = 'review';
        icon = '⚠️';
    }

    statusCard.className = `status-card ${statusClass}`;
    statusCard.innerHTML = `
        <div style="font-size: 3rem; margin-bottom: 10px;">${icon}</div>
        <div style="font-size: 1.5rem; font-weight: bold; margin-bottom: 10px;">${status.replace('_', ' ')}</div>
        <div>${results.overall_message}</div>
    `;
}

function displaySummaryStats(results) {
    const statsGrid = document.getElementById('statsGrid');
    const summary = results.summary;

    statsGrid.innerHTML = `
        <div class="stat-box">
            <span class="stat-number">${summary.total_issues}</span>
            <span class="stat-label">Diferencias Totales</span>
        </div>
        <div class="stat-box">
            <span class="stat-number">${summary.critical_issues}</span>
            <span class="stat-label">Errores Críticos</span>
        </div>
        <div class="stat-box">
            <span class="stat-number">${summary.issues_by_category.visual || 0}</span>
            <span class="stat-label">Diferencias Visuales</span>
        </div>
        <div class="stat-box">
            <span class="stat-number">${summary.issues_by_category.text || 0}</span>
            <span class="stat-label">Diferencias de Texto</span>
        </div>
    `;
}

function displayVisualComparison(results) {
    const visualComp = document.getElementById('visualComparison');
    const visualDetails = document.getElementById('visualDetails');

    const visual = results.visual_comparison;

    // Display comparison image
    visualComp.innerHTML = `
        <img src="${API_URL}/api/results/${currentComparisonId}/image" alt="Comparación Visual">
    `;

    // Display details
    visualDetails.innerHTML = `
        <p><strong>Similitud:</strong> ${(visual.similarity_score * 100).toFixed(2)}%</p>
        <p><strong>Estado:</strong> ${visual.status}</p>
        <p><strong>Mensaje:</strong> ${visual.message}</p>
        <p><strong>Diferencias encontradas:</strong> ${visual.total_differences_found}</p>
        <p><strong>Porcentaje de diferencia:</strong> ${visual.difference_percentage.toFixed(4)}%</p>
    `;
}

function displayTextComparison(results) {
    const textComp = document.getElementById('textComparison');
    const textErrors = document.getElementById('textErrors');

    const text = results.text_comparison;

    // Display master vs supplier text
    textComp.innerHTML = `
        <div class="text-box">
            <h4>📄 Texto Master</h4>
            <div class="text-content">${escapeHtml(text.master.text.substring(0, 500))}${text.master.text.length > 500 ? '...' : ''}</div>
            <p style="margin-top: 10px; color: #666; font-size: 0.9rem;">
                Confianza OCR: ${text.master.confidence.toFixed(1)}% |
                Palabras: ${text.master.word_count}
            </p>
        </div>
        <div class="text-box">
            <h4>📦 Texto Proveedor</h4>
            <div class="text-content">${escapeHtml(text.supplier.text.substring(0, 500))}${text.supplier.text.length > 500 ? '...' : ''}</div>
            <p style="margin-top: 10px; color: #666; font-size: 0.9rem;">
                Confianza OCR: ${text.supplier.confidence.toFixed(1)}% |
                Palabras: ${text.supplier.word_count}
            </p>
        </div>
    `;

    // Display errors
    const errors = text.comparison.common_errors || [];

    if (errors.length > 0) {
        let errorsHTML = '<h4 style="margin-bottom: 15px;">⚠️ Errores Detectados</h4>';

        errors.forEach(error => {
            errorsHTML += `
                <div class="error-item ${error.severity.toLowerCase()}">
                    <div class="error-type">${error.type.replace('_', ' ')}</div>
                    <div class="error-message">${error.message}</div>
                    <div style="margin-top: 5px; font-size: 0.8rem; color: #999;">
                        Severidad: ${error.severity}
                    </div>
                </div>
            `;
        });

        textErrors.innerHTML = errorsHTML;
    } else {
        textErrors.innerHTML = '<p style="color: #28a745;">✅ No se detectaron errores comunes</p>';
    }
}

function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

function resetForm() {
    masterFile = null;
    supplierFile = null;
    currentComparisonId = null;

    document.getElementById('masterFile').value = '';
    document.getElementById('supplierFile').value = '';
    document.getElementById('masterFileInfo').classList.remove('show');
    document.getElementById('supplierFileInfo').classList.remove('show');

    document.querySelector('.upload-section').style.display = 'block';
    document.getElementById('resultsSection').style.display = 'none';

    checkReadyToCompare();

    window.scrollTo({ top: 0, behavior: 'smooth' });
}

function downloadReport() {
    if (!currentComparisonId) return;

    // Download comparison image
    window.open(`${API_URL}/api/results/${currentComparisonId}/image`, '_blank');

    // Could also generate PDF report here in the future
    alert('Reporte descargado. En la versión completa, se generaría un PDF con todos los detalles.');
}
